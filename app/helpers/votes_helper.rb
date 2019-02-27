module VotesHelper
  def ranked_voting(users, votes, candidates, ranks)
    v5 = []
    sup = []
    count = 0
    @winner = ""
    @loser = 0
    @group = votes.group(:user_id).group(:candidate_name).group(:rank).order(:user_id).count
    candidates.each_with_index do |cand, cand_index|
      users.each_with_index do |us, us_index|
        if @group.key?([us_index,cand_index.to_s,0]) == true
          sup << @group.fetch([us_index,cand_index.to_s,0])
        end
      end
      v5 << sup.sum
      sup = []
    end
    binding.pry
    while v5.sum != 0
      divided = v5.map{|s| s.to_f/v5.sum}
      over_fifty = divided.map{|s| s > 0.51}
      if over_fifty.include?(true)
        @winner = candidates[over_fifty.index(true)]
        break
      else
        rem_z = divided
        rem_z.delete(0)
        @loser = divided.index(rem_z.min)
        count = count + 1
        v5[@loser] = 0
        (count..(ranks.length - 1)).each do |r|
          users.each_with_index do |us, us_index|
            @group.delete([us_index,@loser.to_s,r])
          end
        end
      end

      candidates.each_with_index do |cand, cand_index|
        sup = []
        users.each_with_index do |us, us_index|
          if @group.key?([us_index,@loser.to_s,count - 1]) == true
            if @group.key?([us_index,cand_index.to_s,count]) == true
              sup << @group.fetch([us_index,cand_index.to_s,count])
            end
          end
        end
        v5[cand_index] = v5[cand_index] + sup.sum
      end
    end
    return @winner
  end
end
