class ReportsController < ApplicationController
  def index
  end

  def report_by_category
    group = check_id
    @categories = group.keys
    @operations = group.values
  end

  def report_by_date
    group = Operation.where("spend_earn = :spend_earn AND date >= :start_date AND date <= :end_date",
                                {spend_earn: params[:spend_earn], start_date: params[:date_from], end_date: params[:date_to]}).group(:date).sum(:sum)
    @dates = group.map{ |k,v| k.to_s}
    @sums = group.values
  end

  private
  def check_id
    params[:id].blank? ? 
    Operation.joins(:category).where("spend_earn = :spend_earn AND date >= :start_date AND date <= :end_date",
    {spend_earn: params[:spend_earn], start_date: params[:date_from], end_date: params[:date_to]}).group(:name).sum(:sum) :

    Operation.joins(:category).where("category_id = :id AND date >= :start_date AND date <= :end_date",
    {id: params[:id], start_date: params[:date_from], end_date: params[:date_to]}).group(:name).sum(:sum)
  end
end
