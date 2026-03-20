VENV := .venv
PYTHON := python3
PIP := $(VENV)/bin/pip
REQUIREMENTS := requirements.txt

.PHONY: install clean

install:
	$(PYTHON) -m venv $(VENV)
	$(PIP) install --upgrade pip
	@if [ -f $(REQUIREMENTS) ]; then \
		$(PIP) install -r $(REQUIREMENTS); \
	else \
		echo "Fichier $(REQUIREMENTS) introuvable, dépendances ignorées."; \
	fi

clean:
	rm -rf $(VENV)
	find . -type d -name "__pycache__" -prune -exec rm -rf {} +
	find . -type f -name "*.pyc" -delete
