require "spec_helper"

describe RefAPA::Refapa do
    before :all do 
        @libro1 = RefBiblio::Libro.new(["Alexby 11","Mangel Ros","Sr Cheeto"], "Salseo Gamer", "Temas de hoy", Date.new(2015,1,1), 1, ["9788499984"])
		@periodico1 = RefBiblio::ArtPeriodico.new(["Rafael Herrero","Daniel Ramos"], "El Mundo", "Unidad Editorial Informacion General, S.L.U.", Date.new(2015,11,17), "La regeneracion de las gemas", 130, ["1697-0179"], "Cultura", ["20"])
		@documento1 = RefBiblio::DocElectronico.new(["Rafael Herrero","Daniel Ramos"], "Oficina de Software Libre de la ULL", "Universidad de La Laguna", Date.new(2015,11,17), "Estudio del habitat de las gemas", 45, ["0001-0045"], "PDF", "http://osl.ull.es/noticias/")
    end
    it "Insertar elementos" do
        @APA = RefAPA::Refapa.new
        @APA.insertar(@libro1)
        @APA.insertar(@periodico1)
        @APA.insertar(@documento1)
        expect(@APA.to_s).to eq("11, A. & Ros, M. & Cheeto, S.\nSalseo Gamer\nTemas de hoy; 1 edition (January 1, 2015)\nISBN-10: 9788499984\nRafael Herrero, Daniel Ramos.\nEl Mundo\nUnidad Editorial Informacion General, S.L.U.; (November 17, 2015)\nLa regeneracion de las gemas\n130\nISSN: 1697-0179\nSeccion: Cultura\n20\nRafael Herrero, Daniel Ramos.\nOficina de Software Libre de la ULL\nUniversidad de La Laguna; (November 17, 2015)\nEstudio del habitat de las gemas\n45\nISSN: 0001-0045\nFormato: PDF URL: http://osl.ull.es/noticias/\n\n")
    end
end