// Subsystem runlevels
#define INITIALIZE_HINT_NORMAL   0  //Nothing happens
#define INITIALIZE_HINT_LATELOAD 1  //Call LateInitialize
#define INITIALIZE_HINT_QDEL     2  //Call qdel on the atom

#define RUNLEVEL_INIT EMPTY_BITFIELD
#define RUNLEVEL_LOBBY 0x0001
#define RUNLEVEL_SETUP 0x0002
#define RUNLEVEL_GAME 0x0004
#define RUNLEVEL_POSTGAME 0x0008

#define RUNLEVELS_ALL (~EMPTY_BITFIELD)
#define RUNLEVELS_DEFAULT (RUNLEVEL_SETUP | RUNLEVEL_GAME | RUNLEVEL_POSTGAME)

//! ## DB defines
/**
 * DB major schema version
 *
 * Update this whenever the db schema changes
 *
 * make sure you add an update to the schema_version stable in the db changelog
 */
#define DB_MAJOR_VERSION 1

/**
 * DB minor schema version
 *
 * Update this whenever the db schema changes
 *
 * make sure you add an update to the schema_version stable in the db changelog
 */
#define DB_MINOR_VERSION 0

// Subsystem init_order, from highest priority to lowest priority
// Subsystems shutdown in the reverse of the order they initialize in
// The numbers just define the ordering, they are meaningless otherwise.

#define SS_INIT_EARLY            100
#define SS_INIT_INPUT            99
#define SS_INIT_GARBAGE          95
#define SS_INIT_DBCORE           90
#define SS_INIT_CHEMISTRY        18
#define SS_INIT_MATERIALS        17
#define SS_INIT_PLANTS           16
#define SS_INIT_ANTAGS           15
#define SS_INIT_CULTURE          14
#define SS_INIT_MISC             13
#define SS_INIT_SKYBOX           12
#define SS_INIT_STATION          11
#define SS_INIT_MAPPING          10
#define SS_INIT_JOBS             9
#define SS_INIT_CHAR_SETUP       8
#define SS_INIT_CIRCUIT          7
#define SS_INIT_GRAPH            6
#define SS_INIT_OPEN_SPACE       5
#define SS_INIT_ATOMS            4
#define SS_INIT_MACHINES         3
#define SS_INIT_ICON_UPDATE      2
#define SS_INIT_OVERLAY          1
#define SS_INIT_DEFAULT          0
#define SS_INIT_AIR             -1
#define SS_INIT_MISC_LATE       -2
#define SS_INIT_MISC_CODEX      -3
#define SS_INIT_ALARM           -4
#define SS_INIT_SHUTTLE         -5
#define SS_INIT_GOALS           -5
#define SS_INIT_LIGHTING        -6
#define SS_INIT_ZCOPY           -7
#define SS_INIT_HOLOMAP         -8
#define SS_INIT_XENOARCH        -10
#define SS_INIT_BAY_LEGACY      -12
#define SS_INIT_TICKER          -20
#define SS_INIT_AI              -21
#define SS_INIT_AIFAST          -22
#define SS_INIT_CHAT            -90 // Should be lower to ensure chat remains smooth during init.
#define SS_INIT_UNIT_TESTS      -100
