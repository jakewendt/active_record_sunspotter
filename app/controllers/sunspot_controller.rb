class SunspotController < ApplicationController

	include ActiveRecordSunspotter::SearchSunspotFor

	helper :all

	def index
		search_sunspot_for Verse
	end

end

