/* appearance */
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int gappx     = 7;        /* size of gaps */
static const int gapsforone	        = 0;    	/* 1 enable gaps when only one window is open */
static const unsigned int snap      = 30;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const int user_bh            = 25;       /* 0 means that dwm will calculate bar height, >= 1 means dwm will user_bh as bar height */
static const char buttonbar[]       = "[ x ]";
static const char *fonts[]          = { "Jetbrains Mono:size=10:antialias=true:autohint=true" };
static const char dmenufont[]       = "Jetbrains Mono:size=10:antialias=true:autohint=true";
static const char col_gray1[]       = "#282828";
static const char col_gray2[]       = "#49483e";
static const char col_gray3[]       = "#d0d0ca";
static const char col_gray4[]       = "#282828";
static const char col_blue[]        = "#57c1cf";
static const char col_cyan[]        = "#BD93F9";
static const char col_green[]       = "#a6e22e";
static const char col_yellow[]      = "#e6db74";
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
	[SchemeSel]  = { col_blue, col_gray1, col_gray3 },
	[SchemeStatus]  = { col_gray3, col_gray1,  "#000000"  },    // Statusbar right {text,background,not used but cannot be empty}
	[SchemeButton]  = { col_blue, col_gray1,  "#000000"  },     // Button left {text,background,not used but cannot be empty}
	[SchemeTagsSel]  = { col_yellow, col_gray2,  "#000000"  },  // Tagbar left selected {text,background,not used but cannot be empty}
    [SchemeTagsNorm]  = { col_green, col_gray1,  "#000000"  },  // Tagbar left unselected {text,background,not used but cannot be empty}
    [SchemeInfoSel]  = { col_yellow, col_gray1,  "#000000"  },  // infobar middle  selected {text,background,not used but cannot be empty}
    [SchemeInfoNorm]  = { col_gray3, col_gray1,  "#000000"  },  // infobar middle  unselected {text,background,not used but cannot be empty}

};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title                 tags mask     isfloating   monitor    scratchkey       float x,y,w,h */
	{ NULL,       NULL,       "scratchpad",         0,            1,           -1,        's',             5,0,1585,400 },
	{ NULL,       NULL,       "vifm_scratch",       0,            1,           -1,        'v',             5,498,1585,400 }, /*150,200,1300,500*/
};

/* layout(s) */
static const int dirs[3]      = { DirHor, DirVer, DirVer }; /* tiling dirs */
static const float facts[3]   = { 1.1,    1.1,    1.1 };    /* tiling facts */
static const int nmaster     = 1;                           /* number of clients in master area */
static const int resizehints = 0;                           /* 1 means respect size hints in tiled resizals */
static const int attachdirection = 1;                       /* 0 default, 1 above, 2 aside, 3 below, 4 bottom, 5 top */

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },
#define TILEKEYS(MOD,G,M,S) \
	{ MOD, XK_r, setdirs,  {.v = (int[])  { INC(G * +1),   INC(M * +1),   INC(S * +1) } } }, \
	{ MOD, XK_h, setfacts, {.v = (float[]){ INC(G * -0.1), INC(M * -0.1), INC(S * -0.1) } } }, \
	{ MOD, XK_l, setfacts, {.v = (float[]){ INC(G * +0.1), INC(M * +0.1), INC(S * +0.1) } } }, \

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "<||",      tile },     /* first is default */
	{ "[M]",      monocle },
	{ "><>",      NULL },     /* no layout function means floating behavior */
	{ "(G)",      gaplessgrid },
};

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run_history", "-f", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_green, "-sb", col_gray2, "-sf", col_yellow, NULL };
/*static const char *termcmd[]  = { "st", "-e", "/usr/bin/tmux", NULL };*/
static const char *termcmd[]  = { "alacritty", "-t", "normalal", NULL };
/* first arg only serves to match against key in rules */
static const char *scratchpadcmd[] = {"s", "alacritty", "-t", "scratchpad", NULL};
static const char *scratchpadvifm[] = {"v", "alacritty", "-t", "vifm_scratch", "-e", "vifmrun", NULL};
static const char *ffox[] = { "ffox.sh", NULL };
static const char *chromium[] = { "chromium-bin", "--start-fullscreen", NULL };
/*static const char *chr[] = { "google-chrome-stable", NULL };*/
static const char *scrot[] = { "scrot", "%Y-%m-%d-%H-%M-%S_$wx$h.png", "-e", "mv $f ~/pictures/screenshots", NULL };

static Key keys[] = {
	/* modifier                     key                function        argument */
	{ MODKEY,                       XK_a,              spawn,          {.v = dmenucmd } },
	{ MODKEY,                       XK_Return,         spawn,          {.v = termcmd } },
	{ MODKEY,                       XK_grave,          togglescratch,  {.v = scratchpadcmd } },
	{ 0,                            XK_F8,             togglescratch,  {.v = scratchpadvifm } },
	{ MODKEY|ShiftMask,             XK_f,              spawn,          {.v = ffox } },
	{ MODKEY|ShiftMask,             XK_c,              spawn,          {.v = chromium } },
	{ MODKEY,                       XK_Print,          spawn,          {.v = scrot } },
	{ 0,                            XK_Caps_Lock,      spawn,          SHCMD("kill $(ps -aux | grep 'sleep 60' | awk 'NR==1{print $2}')") },
	{ 0,                            XK_ISO_Next_Group, spawn,          SHCMD("kill $(ps -aux | grep 'sleep 60' | awk 'NR==1{print $2}')") },
	{ MODKEY|ShiftMask|ControlMask, XK_s,              spawn,          SHCMD("loginctl suspend") },
	{ MODKEY|ShiftMask|ControlMask, XK_c,              spawn,          SHCMD("sudo shutdown -h now") },
	{ MODKEY|ShiftMask|ControlMask, XK_r,              spawn,          SHCMD("sudo reboot") },
/*  { MODKEY|ShiftMask,             XK_p,              spawn,          SHCMD("google-chrome-stable --start-fullscreen --new-window $(xclip -o -selection clipboard)") },*/
	{ MODKEY|ShiftMask,             XK_0,              spawn,          SHCMD("killall picom; setsid picom --experimental-backends --config .config/picom/picom.conf") },
	{ MODKEY|ShiftMask|ControlMask, XK_0,              spawn,          SHCMD("killall picom; setsid picom --experimental-backends --config .config/picom/picom_noanim.conf") },
	{ MODKEY|ControlMask,           XK_0,              spawn,          SHCMD("killall picom") },
	{ MODKEY|ControlMask,           XK_p,              spawn,          SHCMD("firefox-bin --new-window $(xclip -o -selection clipboard)") },
	{ MODKEY|ShiftMask|ControlMask, XK_1,              spawn,          SHCMD("mpv --demuxer-max-bytes=40MiB --ytdl-format='bestvideo[height<=480]+bestaudio/best[height<=480]' $(xclip -o -selection clipboard)") },
	{ MODKEY|ShiftMask|ControlMask, XK_2,              spawn,          SHCMD("mpv --demuxer-max-bytes=40MiB --ytdl-format='bestvideo[height<=720][fps<=30]+bestaudio/best[height<=720]' $(xclip -o -selection clipboard)") },
	{ MODKEY|ShiftMask|ControlMask, XK_3,              spawn,          SHCMD("mpv --demuxer-max-bytes=40MiB --ytdl-format='bestvideo[height<=720][fps<=50]+bestaudio/best[height<=720]' $(xclip -o -selection clipboard)") },
	{ MODKEY,                       XK_b,              togglebar,      {0} },
	{ MODKEY|ShiftMask,             XK_b,              togglebarall,   {0} },
	{ MODKEY,                       XK_j,              focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,              focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,              incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,              incnmaster,     {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_l,              setcfact,       {.f = +0.7} },
	{ MODKEY|ShiftMask,             XK_h,              setcfact,       {.f = -0.7} },
	{ MODKEY|ShiftMask,             XK_equal,          setcfact,       {.f =  0.00} },
	{ MODKEY|ShiftMask,             XK_j,              movestack,      {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_k,              movestack,      {.i = -1 } },
	{ MODKEY|ControlMask,           XK_Return,         zoom,           {0} },
    { MODKEY,                       XK_space,          switchcol,      {0} },
	{ MODKEY,                       XK_Tab,            view,           {0} },
	{ MODKEY,                       XK_c,              killclient,     {0} },
	{ MODKEY,                       XK_q,              reorganizetags, {0} },
	{ MODKEY|ShiftMask,             XK_i,              setgaps,        {.i = +7 } },
	{ MODKEY|ControlMask,           XK_i,              setgaps,        {.i = -7 } },
	{ MODKEY|ControlMask,           XK_o,              setgaps,        {.i = 0  } },
	{ MODKEY,                       XK_t,              setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_m,              setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_f,              setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_g,              setlayout,      {.v = &layouts[3]} },
	{ MODKEY|ControlMask,           XK_space,          setlayout,      {0} },
	TILEKEYS(MODKEY,                                                   1, 0, 0)
	TILEKEYS(MODKEY|ShiftMask,                                         0, 1, 0)
	TILEKEYS(MODKEY|ControlMask,                                       0, 0, 1)
	TILEKEYS(MODKEY|ShiftMask|ControlMask,                             1, 1, 1)
	{ MODKEY|ShiftMask,             XK_t,              setdirs,        {.v = (int[]){ DirHor, DirVer, DirVer } } },
	{ MODKEY|ControlMask,           XK_t,              setdirs,        {.v = (int[]){ DirVer, DirHor, DirHor } } },
	{ MODKEY|ShiftMask,             XK_space,          togglefloating, {0} },
	{ MODKEY,                       XK_Down,           moveresize,     {.v = "0x 25y 0w 0h" } },
	{ MODKEY,                       XK_Up,             moveresize,     {.v = "0x -25y 0w 0h" } },
	{ MODKEY,                       XK_Right,          moveresize,     {.v = "25 0y 0w 0h" } },
	{ MODKEY,                       XK_Left,           moveresize,     {.v = "-25x 0y 0w 0h" } },
	{ MODKEY|ShiftMask,             XK_Down,           moveresize,     {.v = "0x 0y 0w 25h" } },
	{ MODKEY|ShiftMask,             XK_Up,             moveresize,     {.v = "0x 0y 0w -25h" } },
	{ MODKEY|ShiftMask,             XK_Right,          moveresize,     {.v = "0x 0y 25w 0h" } },
	{ MODKEY|ShiftMask,             XK_Left,           moveresize,     {.v = "0x 0y -25w 0h" } },
	{ MODKEY|ControlMask,           XK_Up,             moveresizeedge, {.v = "t"} },
	{ MODKEY|ControlMask,           XK_Down,           moveresizeedge, {.v = "b"} },
	{ MODKEY|ControlMask,           XK_Left,           moveresizeedge, {.v = "l"} },
	{ MODKEY|ControlMask,           XK_Right,          moveresizeedge, {.v = "r"} },
	{ MODKEY,                       XK_0,              view,           {.ui = ~0 } },
	{ MODKEY,                       XK_o,              winview,        {0} },
	{ MODKEY,                       XK_s,              tag,            {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_s,              toggletag,      {.ui = ~0 } },
	{ MODKEY,                       XK_comma,          focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period,         focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,          tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period,         tagmon,         {.i = +1 } },
	{ MODKEY,                       XK_p,              shiftview,      {.i = -1 } },
	{ MODKEY,                       XK_n,              shiftview,      {.i = +1 } },
	{ MODKEY,                       XK_minus,          shifttag,       {.i = -1 } },
	{ MODKEY,                       XK_equal,          shifttag,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_p,              tagtoleft,      {0} },
	{ MODKEY|ShiftMask,             XK_n,              tagtoright,     {0} },
	TAGKEYS(                        XK_1,                              0)
	TAGKEYS(                        XK_2,                              1)
	TAGKEYS(                        XK_3,                              2)
	TAGKEYS(                        XK_4,                              3)
	TAGKEYS(                        XK_5,                              4)
	TAGKEYS(                        XK_6,                              5)
	TAGKEYS(                        XK_7,                              6)
	TAGKEYS(                        XK_8,                              7)
	TAGKEYS(                        XK_9,                              8)
	{ MODKEY|ShiftMask,             XK_q,              quit,           {0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkButton,	    	0,		        Button1,	    spawn,          SHCMD("xdotool windowactivate --sync $(xdotool getactivewindow) key F11") },
	{ ClkButton,	    	0,		        Button2,	    killclient,     {0} },
	{ ClkButton,	    	0,		        Button3,	    reorganizetags, {0} },
    { ClkButton,	    	0,		        Button4,        incnmaster,     {.i = +1 } },
    { ClkButton,	    	0,		        Button5,        incnmaster,     {.i = -1 } },
	{ ClkLtSymbol,          0,              Button1,        togglescratch,  {.v = scratchpadcmd } },
	{ ClkLtSymbol,          0,              Button2,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setcfact,       {.f = 0.00} },
	{ ClkLtSymbol,          0,              Button4,        setcfact,       {.f = +0.1} },
	{ ClkLtSymbol,          0,              Button5,        setcfact,       {.f = -0.1} },
	{ ClkWinTitle,          0,              Button1,        togglefloating, {0} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkWinTitle,          0,              Button3,        resizemouse,    {0} },
	{ ClkWinTitle,          0,              Button4,        setfacts,       {.v = (float[]) {INC(-0.1), INC(-0.1), INC(-0.1)} } },
	{ ClkWinTitle,          0,              Button5,        setfacts,       {.v = (float[]) {INC(+0.1), INC(+0.1), INC(+0.1)} } },
	{ ClkStatusText,        0,              Button1,        view,           {.ui = ~0 } },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = ffox } },
	{ ClkStatusText,        0,              Button3,        winview,        {0} },
	{ ClkStatusText,        0,              Button4,        focusstack,     {.i = +1 } },
	{ ClkStatusText,        0,              Button5,        focusstack,     {.i = -1 } },
	{ ClkClientWin,         0,              Button2,        movemouse,      {0} },
	{ ClkTagBar,            0,              Button2,        toggleview,     {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        tag,            {0} },
	{ ClkTagBar,            0,              Button4,        shiftview,      {.i = -1 } },
	{ ClkTagBar,            0,              Button5,        shiftview,      {.i = +1 } },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};
