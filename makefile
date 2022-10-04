main: 
	latexmk -xelatex -synctex=1 main.tex

clean:
	@echo "Cleaning..."
	@$(RM) *.aux *.fls *.log *.ind *.out *.ilg *.idx *.toc *.blg *.bbl *. nlo *.xdv
	@echo "Done!"
