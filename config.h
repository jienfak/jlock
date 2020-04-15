/* user and group to drop privileges to */
static const char *user  = "nobody";
static const char *group = "nogroup";

static const char *colorname[NUMCOLS] = {
	[INIT] =   "black",     /* after initialization */
	[INPUT] =  "#FFFFFF",   /* during input */
	[FAILED] = "#777777",   /* wrong password */
};

/* treat a cleared input like a wrong password (color) */
static const int failonclear = 1;
