// All signals. Format:
// When the signal is called: (signal arguments)
// All signals send the source datum of the signal as the first argument

// global signals
// These are signals which can be listened to by any component on any parent

/// Called after an explosion happened : (epicenter, devastation_range, heavy_impact_range, light_impact_range, flash_range)
#define COMSIG_GLOB_EXPLOSION "!explosion"
/// Mob was created somewhere : (mob)
#define COMSIG_GLOB_MOB_CREATED "!mob_created"
/// Mob died somewhere : (mob/living, gibbed)
#define COMSIG_GLOB_MOB_DEATH "!mob_death"

//////////////////////////////////////////////////////////////////

// /datum signals
/// When a component is added to a datum: (/datum/component)
#define COMSIG_COMPONENT_ADDED "component_added"
/// Before a component is removed from a datum because of RemoveComponent: (/datum/component)
#define COMSIG_COMPONENT_REMOVING "component_removing"
/// Before a datum's Destroy() is called: (force), returning a nonzero value will cancel the qdel operation
#define COMSIG_PARENT_PREQDELETED "parent_preqdeleted"
/// Just before a datum's Destroy() is called: (force), at this point none of the other components chose to interrupt qdel and Destroy will be called
#define COMSIG_PARENT_QDELETING "parent_qdeleting"

/// Fires on the target datum when an element is attached to it (/datum/element)
#define COMSIG_ELEMENT_ATTACH "element_attach"
/// Fires on the target datum when an element is attached to it  (/datum/element)
#define COMSIG_ELEMENT_DETACH "element_detach"

// /atom signals

// /atom/movable signals
/// When an atom's Dispell() proc is called
#define COMSIG_ATOM_MOVABLE_DISPELL "atom_dispell"

// /area signals

// /turf signals

// /obj signals

// /mob signals
// From base of mob/death(): (gibbed)
#define COMSIG_MOB_DEATH "living_death"
