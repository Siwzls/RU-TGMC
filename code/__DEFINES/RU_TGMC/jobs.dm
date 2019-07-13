#define JOB_DISPLAY_ORDER_DEFAULT 0

#define JOB_DISPLAY_ORDER_CAPTAIN 1
#define JOB_DISPLAY_ORDER_EXECUTIVE_OFFICER 2
#define JOB_DISPLAY_ORDER_STAFF_OFFICER 3
#define JOB_DISPLAY_ORDER_PILOT_OFFICER 4
#define JOB_DISPLAY_ORDER_TANK_CREWMAN 5
#define JOB_DISPLAY_ORDER_WALKER_PILOT 6
#define JOB_DISPLAY_ORDER_CORPORATE_LIAISON 7
#define JOB_DISPLAY_ORDER_AI 8
#define JOB_DISPLAY_ORDER_SYNTHETIC 9
#define JOB_DISPLAY_ORDER_CHIEF_MP 10
#define JOB_DISPLAY_ORDER_MILITARY_POLICE 11
#define JOB_DISPLAY_ORDER_CHIEF_ENGINEER 12
#define JOB_DISPLAY_ORDER_MAINTENANCE_TECH 13
#define JOB_DISPLAY_ORDER_REQUISITIONS_OFFICER 14
#define JOB_DISPLAY_ORDER_CARGO_TECH 15
#define JOB_DISPLAY_ORDER_CHIEF_MEDICAL_OFFICER 16
#define JOB_DISPLAY_ORDER_DOCTOR 17
#define JOB_DISPLAY_ORDER_MEDIAL_RESEARCHER 18
#define JOB_DISPLAY_ORDER_SQUAD_LEADER 19
#define JOB_DISPLAY_ORDER_SQUAD_SPECIALIST 20
#define JOB_DISPLAY_ORDER_SQUAD_SMARTGUNNER 21
#define JOB_DISPLAY_ORDER_SQUAD_CORPSMAN 22
#define JOB_DISPLAY_ORDER_SUQAD_ENGINEER 23
#define JOB_DISPLAY_ORDER_SQUAD_MARINE 24


#define CAPTAIN "Captain"
#define EXECUTIVE_OFFICER "Executive Officer" //Currently disabled.
#define FIELD_COMMANDER "Field Commander"
#define INTELLIGENCE_OFFICER "Intelligence Officer"
#define PILOT_OFFICER "Pilot Officer"
#define REQUISITIONS_OFFICER "Requisitions Officer"
#define CHIEF_SHIP_ENGINEER "Chief Ship Engineer"
#define CHIEF_MEDICAL_OFFICER "Chief Medical Officer"
#define COMMAND_MASTER_AT_ARMS "Command Master at Arms"
#define TANK_CREWMAN "Tank Crewman"
#define WALKER_PILOT "Walker Pilot"
#define CORPORATE_LIAISON "Corporate Liaison"
#define SYNTHETIC "Synthetic"
#define MASTER_AT_ARMS "Master at Arms"
#define SHIP_ENGINEER "Ship Engineer"
#define CARGO_TECHNICIAN "Cargo Technician"
#define MEDICAL_OFFICER "Medical Officer"
#define MEDICAL_RESEARCHER "Medical Researcher"
#define SQUAD_LEADER "Squad Leader"
#define SQUAD_SPECIALIST "Squad Specialist"
#define SQUAD_SMARTGUNNER "Squad Smartgunner"
#define SQUAD_CORPSMAN "Squad Corpsman"
#define SQUAD_ENGINEER "Squad Engineer"
#define SQUAD_MARINE "Squad Marine"
#define SILICON_AI "AI"


GLOBAL_LIST_INIT(jobs_command, list(CAPTAIN, FIELD_COMMANDER, INTELLIGENCE_OFFICER, PILOT_OFFICER, REQUISITIONS_OFFICER, CHIEF_SHIP_ENGINEER, \
CHIEF_MEDICAL_OFFICER, SYNTHETIC, SILICON_AI, COMMAND_MASTER_AT_ARMS))
GLOBAL_LIST_INIT(jobs_police, list(COMMAND_MASTER_AT_ARMS, MASTER_AT_ARMS))
GLOBAL_LIST_INIT(jobs_officers, list(CAPTAIN, FIELD_COMMANDER, INTELLIGENCE_OFFICER, PILOT_OFFICER, TANK_CREWMAN, WALKER_PILOT, CORPORATE_LIAISON, SYNTHETIC, SILICON_AI))
GLOBAL_LIST_INIT(jobs_engineering, list(CHIEF_SHIP_ENGINEER, SHIP_ENGINEER))
GLOBAL_LIST_INIT(jobs_requisitions, list(REQUISITIONS_OFFICER, CARGO_TECHNICIAN))
GLOBAL_LIST_INIT(jobs_medical, list(CHIEF_MEDICAL_OFFICER, MEDICAL_OFFICER, MEDICAL_RESEARCHER))
GLOBAL_LIST_INIT(jobs_marines, list(SQUAD_LEADER, SQUAD_SPECIALIST, SQUAD_SMARTGUNNER, SQUAD_CORPSMAN, SQUAD_ENGINEER, SQUAD_MARINE))
GLOBAL_LIST_INIT(jobs_regular_all, list(CAPTAIN, FIELD_COMMANDER, INTELLIGENCE_OFFICER, PILOT_OFFICER, REQUISITIONS_OFFICER, CHIEF_SHIP_ENGINEER, \
CHIEF_MEDICAL_OFFICER, SYNTHETIC, SILICON_AI, COMMAND_MASTER_AT_ARMS, MASTER_AT_ARMS, TANK_CREWMAN, WALKER_PILOT, CORPORATE_LIAISON, SHIP_ENGINEER, CARGO_TECHNICIAN, \
MEDICAL_OFFICER, MEDICAL_RESEARCHER, SQUAD_LEADER, SQUAD_SPECIALIST, SQUAD_SMARTGUNNER, SQUAD_CORPSMAN, SQUAD_ENGINEER, SQUAD_MARINE))
GLOBAL_LIST_INIT(jobs_unassigned, list(SQUAD_MARINE))


#define ROLE_XENOMORPH "Xenomorph"
#define ROLE_XENO_QUEEN "Xeno Queen"
#define ROLE_SURVIVOR "Survivor"
#define ROLE_ERT "Emergency Response Team"


//Playtime tracking system, see jobs_exp.dm
#define EXP_TYPE_LIVING			"Living"
#define EXP_TYPE_REGULAR_ALL	"Any"
#define EXP_TYPE_COMMAND		"Command"
#define EXP_TYPE_ENGINEERING	"Engineering"
#define EXP_TYPE_MEDICAL		"Medical"
#define EXP_TYPE_MARINES		"Marines"
#define EXP_TYPE_REQUISITIONS	"Requisitions"
#define EXP_TYPE_POLICE			"Police"
#define EXP_TYPE_SILICON		"Silicon"
#define EXP_TYPE_SPECIAL		"Special"
#define EXP_TYPE_GHOST			"Ghost"
#define EXP_TYPE_ADMIN			"Admin"

// hypersleep bay flags
#define CRYO_MED		"Medical"
#define CRYO_SEC		"Security"
#define CRYO_ENGI		"Engineering"
#define CRYO_REQ		"Requisitions"
#define CRYO_ALPHA		"Alpha Squad"
#define CRYO_BRAVO		"Bravo Squad"
#define CRYO_CHARLIE	"Charlie Squad"
#define CRYO_DELTA		"Delta Squad"


#define XP_REQ_INTERMEDIATE 60
#define XP_REQ_EXPERIENCED 180