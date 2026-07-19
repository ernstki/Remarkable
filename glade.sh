#!/bin/bash
export GTK_THEME=Adwaita-Slim
export GLADE_CATALOG_SEARCH_PATH=data/ui
glade "$@"
