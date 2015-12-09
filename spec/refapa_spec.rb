require "spec_helper"

describe RefAPA::Refapa do
    before :all do 
        @libro1 = RefBiblio::Libro.new(["Alexby 11","Mangel Ros","Sr Cheeto"], "Salseo Gamer", "Temas de hoy", Date.new(2015,1,1), 1, 1)
=begin
		@periodico1 = RefBiblio::ArtPeriodico.new(["Rafael Herrero","Daniel Ramos"], "El Mundo", "Unidad Editorial Informacion General, S.L.U.", Date.new(2015,11,17), "La regeneracion de las gemas", 130, ["1697-0179"], "Cultura", ["20"])
		@documento1 = RefBiblio::DocElectronico.new(["Rafael Herrero","Daniel Ramos"], "Oficina de Software Libre de la ULL", "Universidad de La Laguna", Date.new(2015,11,17), "Estudio del habitat de las gemas", 45, ["0001-0045"], "PDF", "http://osl.ull.es/noticias/")
=end
    end
    it "Insertar elementos" do
        @APA = RefAPA::Refapa.new
        @APA.insertar(@libro1)
=begin
        @APA.insertar(@periodico1)
        @APA.insertar(@documento1)
=end
        expect(@APA.to_s).to eq("11, A. & Ros, M. & Cheeto, S. (January 1, 2015). Salseo Gamer (1) (1). Temas de hoy.\n")
    end
end