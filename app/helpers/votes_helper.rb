module VotesHelper
  def ranked_voting(users,votes, candidates, ranks)
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
    while v5.sum != 0
      if v5.map{|s| s.to_f/v5.sum}.map{|s| s> 0.51}.index(true) != nil
        @winner = candidates[v5.map{|s| s.to_f/v5.sum}.map{|s| s> 0.51}.index(true)]
        break
      else
        @loser = v5.map{|s| s.to_f/v5.sum}.index(v5.map{|s| s.to_f/v5.sum}.min)
        count = count + 1
        v5[@loser] = 0
        (count..(ranks.length - 1)).each do |r|
          users.each_with_index do |us, us_index|
            @group.delete([us_index,@loser.to_s,r])
          end
        end
      end
      candidates.each_with_index do |cand, cand_index|
        users.each_with_index do |us, us_index|
          if @group.key?([us_index,@loser.to_s,count - 1]) == true
            if @group.key?([us_index,cand_index.to_s,count]) == true
              sup << @group.fetch([us_index,cand_index.to_s,count])
            end
          end
        end
        v5[cand_index] = v5[cand_index] + sup.sum
        sup = []
      end
    end
  end
end
