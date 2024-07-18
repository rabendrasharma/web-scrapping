class CompaniesController < ApplicationController
  def create
    n = params[:n].to_i
    scraper = ScraperService.new(n, filter_params || {})
    companies = scraper.scrape

    csv = generate_csv(companies)

    send_data csv, filename: "yc_companies.csv"
  end

  private

  def generate_csv(companies)
    CSV.generate(headers: true) do |csv|
      csv << ['Name', 'Location', 'Description', 'YC Batch', 'Url']
      companies.each do |company|
        csv << [
          company[:name],
          company[:location],
          company[:description],
          company[:yc_batch],
          company[:url]
        ]
      end
    end
  end

  def filter_params
    return if params[:filter].blank?
    params.require(:filters).permit(:batch, :regions, :industry, :tags, :top_company, :isHiring, :nonprofit, :highlight_black, :highlight_latinx, :highlight_women)
  end
end
