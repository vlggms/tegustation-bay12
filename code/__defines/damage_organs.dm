// Damage things. TODO: Merge these down to reduce on defines.
// Way to waste perfectly good damage-type names (BRUTE) on this... If you were really worried about case sensitivity, you could have just used lowertext(damagetype) in the proc.
#define BRUTE       "brute"
#define BURN        "fire"
#define TOX         "tox"
#define OXY         "oxy"
#define CLONE       "clone"
#define PAIN        "pain"
#define ELECTROCUTE "electrocute"
#define PSIONIC     "psi"

#define CUT       "cut"
#define BRUISE    "bruise"
#define PIERCE    "pierce"
#define LASER     "laser"
#define SHATTER   "shatter"

#define STUN      "stun"
#define WEAKEN    "weaken"
#define PARALYZE  "paralize"
#define IRRADIATE "irradiate"
#define SLUR      "slur"
#define STUTTER   "stutter"
#define EYE_BLUR  "eye_blur"
#define DROWSY    "drowsy"

// Damage flags
#define DAM_SHARP     1
#define DAM_EDGE      2
#define DAM_LASER     4
#define DAM_BULLET    8
#define DAM_EXPLODE   16
#define DAM_DISPERSED 32 // Makes apply_damage calls without specified zone distribute damage rather than randomly choose organ (for humans)
#define DAM_BIO       64 // Toxin damage that should be mitigated by biological (i.e. sterile) armor

#define FIRE_DAMAGE_MODIFIER 0.0215 // Higher values result in more external fire damage to the skin. (default 0.0215)
#define AIR_DAMAGE_MODIFIER  5.0    // More means less damage from hot air scalding lungs, less = more damage. (default 2.025)
#define MAX_PRESSURE_LUNGS_DAMAGE 10.0 // The maximum amount of damage each tick in extreme pressure environments

// Organ defines.
#define ORGAN_CUT_AWAY   (1<<0)  // The organ is in the process of being surgically removed.
#define ORGAN_BLEEDING   (1<<1)  // The organ is currently bleeding.
#define ORGAN_BROKEN     (1<<2)  // The organ is broken.
#define ORGAN_DEAD       (1<<3)  // The organ is necrotic.
#define ORGAN_MUTATED    (1<<4)  // The organ is unusable due to genetic damage.
#define ORGAN_ARTERY_CUT (1<<6)  // The organ has had its artery cut.
#define ORGAN_TENDON_CUT (1<<7)  // The organ has had its tendon cut.
#define ORGAN_DISFIGURED (1<<8)  // The organ is scarred/disfigured. Alters whether or not the face can be recognised.
#define ORGAN_SABOTAGED  (1<<9)  // The organ will explode if exposed to EMP, if prosthetic.
#define ORGAN_ASSISTED   (1<<10) // The organ is partially prosthetic. No mechanical effect.
#define ORGAN_ROBOTIC    (1<<11) // The organ is robotic. Changes numerous behaviors, search BP_IS_ROBOTIC for checks.
#define ORGAN_BRITTLE    (1<<12) // The organ takes additional blunt damage. If robotic, cannot be repaired through normal means.
#define ORGAN_CRYSTAL    (1<<13) // The organ does not suffer laser damage, but shatters on droplimb.

// Flags for proc/take_organ_damage
#define ORGAN_DAMAGE_SHARP       (1 << 0) // Damage should be treated as sharp when applied
#define ORGAN_DAMAGE_EDGE        (1 << 1) // Damage should be treated as edged when applied
#define ORGAN_DAMAGE_FLESH_ONLY  (1 << 2) // Damage should not be applied to robotic organs
#define ORGAN_DAMAGE_ROBOT_ONLY  (1 << 3) // Damage should not be applied to flesh organs
#define ORGAN_DAMAGE_SILICON_EMP (1 << 4) // Damage should be treated as bypassing armor for silicons

// Organ flag defines.
#define ORGAN_FLAG_CAN_AMPUTATE   (1<<0) // The organ can be amputated.
#define ORGAN_FLAG_CAN_BREAK      (1<<1) // The organ can be broken.
#define ORGAN_FLAG_CAN_GRASP      (1<<2) // The organ contributes to grasping.
#define ORGAN_FLAG_CAN_STAND      (1<<3) // The organ contributes to standing.
#define ORGAN_FLAG_HAS_TENDON     (1<<4) // The organ can have its tendon cut.
#define ORGAN_FLAG_FINGERPRINT    (1<<5) // The organ has a fingerprint.
#define ORGAN_FLAG_GENDERED_ICON  (1<<6) // The icon state for this organ appends _m/_f.
#define ORGAN_FLAG_HEALS_OVERKILL (1<<7) // The organ heals from overkill damage.
#define ORGAN_FLAG_DEFORMED       (1<<8) // The organ is permanently disfigured.

// Droplimb types.
#define DROPLIMB_EDGE 0
#define DROPLIMB_BLUNT 1
#define DROPLIMB_BURN 2

// Robotics hatch_state defines.
#define HATCH_CLOSED 0
#define HATCH_UNSCREWED 1
#define HATCH_OPENED 2

// These control the amount of blood lost from burns. The loss is calculated so
// that dealing just enough burn damage to kill the player will cause the given
// proportion of their max blood volume to be lost
// (e.g. 0.6 == 60% lost if 200 burn damage is taken).
#define FLUIDLOSS_WIDE_BURN 0.6 //for burns from heat applied over a wider area, like from fire
#define FLUIDLOSS_CONC_BURN 0.4 //for concentrated burns, like from lasers

// Damage above this value must be repaired with surgery.
#define ROBOLIMB_SELF_REPAIR_CAP 30

//Germs and infections.
#define GERM_LEVEL_AMBIENT  275 // Maximum germ level you can reach by standing still.
#define GERM_LEVEL_MOVE_CAP 300 // Maximum germ level you can reach by running around.

#define INFECTION_LEVEL_ONE   250
#define INFECTION_LEVEL_TWO   500  // infections grow from ambient to two in ~5 minutes
#define INFECTION_LEVEL_THREE 1000 // infections grow from two to three in ~10 minutes

//Blood levels. These are percentages based on the species blood_volume far.
#define BLOOD_VOLUME_FULL    100
#define BLOOD_VOLUME_SAFE    85
#define BLOOD_VOLUME_OKAY    70
#define BLOOD_VOLUME_BAD     60
#define BLOOD_VOLUME_SURVIVE 30


// Minimum damage delt to external(parent) organ to be able to damage internal organs
// The number changes a bit depending on properties of the weapon used
#define INTERNAL_ORGAN_DAMAGE_THRESHOLD 30

// Damage thresholds for limb(external organ) dismemberment from various damage sources
// Those are all multipliers of max_damage of limb itself, so for organ with 100 max health - Edge threshold will be 20.
#define DROPLIMB_THRESHOLD_EDGE 0.2
#define DROPLIMB_THRESHOLD_TEAROFF 0.4
#define DROPLIMB_THRESHOLD_DESTROY_BRUTE 0.6
#define DROPLIMB_THRESHOLD_DESTROY_BURN 0.7
// Multiplier of spillover damage. The spillover is added to brute/burn in droplimb calculations.
// 0.1 mult with 100 damage above maximum limb's health will equate to +10 damage in the calculation, simple enough.
#define DROPLIMB_SPILLOVER_MULT 0.05

#define ORGAN_RECOVERY_THRESHOLD (5 MINUTES)

// Stages of appendix inflamation
// Worth mentioning that the value increase by one every tick, so consider these the time it'd take to kill someone
/// Early effects of appendicitis - owner is getting slight organ and toxin damage
#define APPENDIX_INFLAMATION_EARLY 200
/// The owner starts vomiting
#define APPENDIX_INFLAMATION_MIDDLE 400
/// The finale - appendix rupture is inevitable
#define APPENDIX_INFLAMATION_CRITICAL 600
