TITLE = Remarkable project maintenance tasks

help:  # prints this help
	@perl -e "$$AUTOGEN_HELP_PL" Makefile

install: build  # builds and (re)installs the Debian package
	sudo apt install "$$(ls -t ../remarkable_*_all.deb | head -1)"

build:  # builds the Debian package (in the parent dir.)
	dpkg-buildpackage -b --no-sign

run:  # runs Remarkable from source repository
	./run.sh

glade:  # opens UI layout files with Glade
	./glade.sh data/ui/RemarkableWindow.ui data/ui/PreferencesRemarkableDialog.ui



##  internals you can safely ignore
##
define AUTOGEN_HELP_PL
# line XXX
    if (-t 1) {
        $$UL = "\e[0;4m"; $$BOLDBLUE = "\e[1m\e[1;34m"; $$RESET = "\e[0m";
    }
    $$max = 0;
    @targets = ();
    print "\n  ", $$UL, "Makefile targets - $(TITLE)", $$RESET, "\n\n";
    while (<>) {
        push @targets, [$$1, $$2] if /^(\w.+):[^=].*#\s*(.*)/;
        $$max = length($$1) if length($$1) > $$max;
    }
    foreach (@targets) {
        printf "    %smake %-$${max}s%s    %s\n", $$BOLDBLUE, @$$_[0], $$RESET, @$$_[1];
    }
    print "\n";
endef
export AUTOGEN_HELP_PL
