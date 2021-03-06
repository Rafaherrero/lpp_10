require "spec_helper"

describe RefAPA::Refapa do
    before :all do 
        @libro1 = RefBiblio::Libro.new(["Alexby 11","Mangel Ros","Sr Cheeto"], "Salseo Gamer", "Temas de hoy", Date.new(2015,1,1), 1, 1)
		@periodico1 = RefBiblio::ArtPeriodico.new(["Rafael Herrero","Daniel Ramos"], "La regeneracion de las gemas", Date.new(2015,11,17), "El Mundo", 130)
		@documento1 = RefBiblio::DocElectronico.new(["Rafael Herrero","Daniel Ramos"], "Estudio del habitat de las gemas", "Universidad de La Laguna", "Oficina de Software Libre de la ULL", Date.new(2015,11,17), "PDF", "http://osl.ull.es/noticias/", Date.new(2015,12,9))
    end
    before :each do
        @APA = RefAPA::Refapa.new
    end
    describe "Insertar elementos" do
        it "Insertar libro y bien formateado" do
            @APA.insertar(@libro1)
            expect(@APA.to_s).to eq("11, A. & Ros, M. & Cheeto, S. (January 1, 2015). Salseo Gamer (1) (1). Temas de hoy.\n")
        end
        it "Insertar periodico y bien formateado" do
            @APA.insertar(@periodico1)
            expect(@APA.to_s).to eq("Herrero, R. & Ramos, D. (November 17, 2015). La Regeneracion de las Gemas. El Mundo, pp. 130.\n")
        end
        it "Insertar documento electronico" do
            @APA.insertar(@documento1)
            expect(@APA.to_s).to eq("Herrero, R. & Ramos, D. (November 17, 2015). Estudio del Habitat de las GemasPdf. Universidad de La Laguna: Oficina de Software Libre de la ULL. Disponible en: http://osl.ull.es/noticias/ (December 9, 2015). \n")
        end
        it "Insertar todo y bien formateado" do
        @APA.insertar(@libro1)
        @APA.insertar(@periodico1)
        @APA.insertar(@documento1)
        expect(@APA.to_s).to eq("11, A. & Ros, M. & Cheeto, S. (January 1, 2015). Salseo Gamer (1) (1). Temas de hoy.\nHerrero, R. & Ramos, D. (November 17, 2015). La Regeneracion de las Gemas. El Mundo, pp. 130.\nHerrero, R. & Ramos, D. (November 17, 2015). Estudio del Habitat de las GemasPdf. Universidad de La Laguna: Oficina de Software Libre de la ULL. Disponible en: http://osl.ull.es/noticias/ (December 9, 2015). \n")
    end
end
end