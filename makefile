main: 
	latexmk -xelatex -synctex=1 main.tex
pvc:
	latexmk -xelatex -synctex=1 -pvc main.tex
clean:
	@echo "Cleaning..."
	latexmk -c
	@echo "Done!"
