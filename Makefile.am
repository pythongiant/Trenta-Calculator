# The actual runnable program is set to the SCRIPTS primitive.
# # Prefix bin_ tells where to copy this
bin_PROGRAMS = trenta-calc
trenta_calc_CFLAGS = $(gtk_CFLAGS)
trenta_calc_LDADD = $(gtk_LIBS)
trenta_calc_VALAFLAGS = --pkg gtk+-3.0
trenta_calc_SOURCES = main.vala

desktopdir = $(datadir)/applications
desktop_DATA = \
	calc.desktop