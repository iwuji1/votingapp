require 'csv'

class FrontPagesController < ApplicationController
  def home
  end

  def help
  end

  def thankyou
  end

  def dataform
  end

  def create
    file_data = params[:file]

    CSV.parse(file_data.read) do |row|
      email = row[0]
      international = row[1]
      multicultural = row[2]

      category = ['student']
      if international == 'yes'
        category.append('international')
      end
      if multicultural == 'yes'
        category.append('mcd')
      end
      category.append('')

      User.create!(
        email: email,
        admin: false,
        category: category.join(','),
      )
    end
    redirect_to(thanks_path)
  end
end
