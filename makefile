main: 
	latexmk -xelatex -synctex=1 main.tex

clean:
	@echo "Cleaning..."
	latexmk -c
	@echo "Done!"
