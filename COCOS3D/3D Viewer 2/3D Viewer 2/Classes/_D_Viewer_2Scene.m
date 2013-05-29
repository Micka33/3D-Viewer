/**
 *  _D_Viewer_2Scene.m
 *  3D Viewer 2
 *
 *  Created by beingenious on 4/16/13.
 *  Copyright __MyCompanyName__ 2013. All rights reserved.
 */

#import "_D_Viewer_2Scene.h"
#import "CC3PODResourceNode.h"
#import "CC3ActionInterval.h"
#import "CC3MeshNode.h"
#import "CC3Camera.h"
#import "CC3Light.h"

#define ObjectName	@"3DObject"


@implementation _D_Viewer_2Scene


-(void) dealloc {
	[super dealloc];
}

-(void) addPins {
    [self->pins addPinViaDbWithName:@"Pin_1366966403839" atLocation:cc3v(-0.20941386462854136, 0.9469149859603877, -0.26865815141513333) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966404392" atLocation:cc3v(-0.10162082835430497, 0.9234242313754076, -0.3246147946145533) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966404995" atLocation:cc3v(0.004380294561637191, 0.9023383390570635, -0.34046804195678215) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966405526" atLocation:cc3v(0.0881838726299643, 0.908293837107801, -0.3284115989212273) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966406029" atLocation:cc3v(0.17058961916660062, 0.9247753060787196, -0.2950459950830696) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966406619" atLocation:cc3v(0.2400579325655459, 0.9417657566473002, -0.24195858063118444) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966407150" atLocation:cc3v(0.24545484604754433, 0.8567764669193263, -0.23581767769744383) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966407663" atLocation:cc3v(0.20453681784063565, 0.8363283585802074, -0.27166621336727126) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966408050" atLocation:cc3v(0.17529524635362614, 0.8270340294318671, -0.29273163068144303) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966408530" atLocation:cc3v(0.08372041817061897, 0.810766128808641, -0.32960248358516675) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966408998" atLocation:cc3v(-0.01313497352535426, 0.8056125454569812, -0.3412830187715767) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966409433" atLocation:cc3v(-0.05710017424923476, 0.8081873254567619, -0.3354473394531963) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966409933" atLocation:cc3v(-0.1333258280603289, 0.7999550510335918, -0.31381484995079023) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966410505" atLocation:cc3v(-0.1897528589901923, 0.8132266566317077, -0.2830665744387148) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966411147" atLocation:cc3v(-0.29077652957644445, 0.8389618905435081, -0.1792660330813526) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966411675" atLocation:cc3v(-0.24998500272438512, 0.7221790253596302, -0.23659812533292757) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966412200" atLocation:cc3v(-0.11516332128891342, 0.6821213744646546, -0.32000169074718937) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966412663" atLocation:cc3v(0.004380294561637191, 0.6745636453337189, -0.34046804195678215) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966413135" atLocation:cc3v(0.11959075159051412, 0.6776809164938447, -0.3200318658879278) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966413581" atLocation:cc3v(0.17058961916660062, 0.6868477108921047, -0.2950459950830696) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966414249" atLocation:cc3v(0.25635267390756594, 0.7084656226324554, -0.22341761007975328) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966415475" atLocation:cc3v(0.31057442563636284, 0.7182034023422237, -0.14344433813031904) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966416621" atLocation:cc3v(0.3288811185996769, 0.5381691432463166, -0.0890958370318174) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966417163" atLocation:cc3v(0.30892782745425684, 0.4054678303704498, -0.15417368123191585) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966417645" atLocation:cc3v(0.3042567983395575, 0.2849389488108395, -0.15314123672475807) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966418212" atLocation:cc3v(0.3042567983395575, 0.18834946693099727, -0.15314126428196423) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966418743" atLocation:cc3v(0.2977579272978781, 0.09605095206788176, -0.16437024708833686) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966419587" atLocation:cc3v(-0.2731196630914448, 0.037671682537809, -0.20339920125619163) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966420148" atLocation:cc3v(-0.28485214361145483, 0.1376785438867449, -0.1873118003332733) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966420697" atLocation:cc3v(-0.29760853968331796, 0.24960719342801557, -0.1653750654963254) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966421234" atLocation:cc3v(-0.29760853968331796, 0.3168091057426451, -0.1653750654963254) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966421782" atLocation:cc3v(-0.29661606690368636, 0.4114352331342456, -0.17205070223687877) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966422365" atLocation:cc3v(-0.29760853968331796, 0.4704135239884374, -0.16537507927492848) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966422955" atLocation:cc3v(-0.3045366693252562, 0.5704020907971379, -0.15128864842665188) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966423487" atLocation:cc3v(-0.3045366693252562, 0.6332429925662991, -0.15128864842665188) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966423972" atLocation:cc3v(-0.2297685402601956, 0.606589056515741, -0.2507693359259366) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966424506" atLocation:cc3v(-0.09712168042368884, 0.5827301927709576, -0.32614736107759457) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966424971" atLocation:cc3v(0.013144925982589267, 0.5783762644274708, -0.3399028987729786) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966425467" atLocation:cc3v(0.12416455888190263, 0.5853472455249783, -0.3178792898436306) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966426001" atLocation:cc3v(0.23469519001917827, 0.6074464163136002, -0.2480605727898358) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966427147" atLocation:cc3v(0.2977579272978781, 0.6243312125537869, -0.16437019197392455) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966427745" atLocation:cc3v(0.26739134664823994, 0.501945195757055, -0.2108572697510718) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966428299" atLocation:cc3v(0.12416455888190263, 0.4922237850277421, -0.3178792898436306) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966428785" atLocation:cc3v(0.013144925982589267, 0.4863618712491033, -0.3399028987729786) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966429304" atLocation:cc3v(-0.07919968605828281, 0.48839818344063735, -0.33225227430009824) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966429849" atLocation:cc3v(-0.1897528589901923, 0.5014897853681561, -0.283066601995921) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966430488" atLocation:cc3v(-0.22464400220382202, 0.4263652038414953, -0.25527306524207577) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966431053" atLocation:cc3v(-0.13321581969336263, 0.41296912234318234, -0.31534394420585615) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966431624" atLocation:cc3v(0.03500424832163749, 0.4069242838300941, -0.34245036958146075) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966432134" atLocation:cc3v(0.17989085139508237, 0.41374899127733683, -0.291680157923436) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966432732" atLocation:cc3v(0.28471154674565774, 0.35114428232212047, -0.18828897886348953) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966433236" atLocation:cc3v(0.14259802877212754, 0.29856463695082647, -0.30881313436224445) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966433747" atLocation:cc3v(0.021914981867340196, 0.29366061165809615, -0.3393374249027012) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966434224" atLocation:cc3v(-0.11064163156366343, 0.2965196166821478, -0.32154194567074756) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966434821" atLocation:cc3v(-0.18496235560821284, 0.3022555940286635, -0.28583916006426796) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966435299" atLocation:cc3v(-0.21446682284193028, 0.25097185383396137, -0.2642173352006434) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966435802" atLocation:cc3v(-0.10162082835430497, 0.2385880863037108, -0.3246147946145533) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966436283" atLocation:cc3v(-0.013134974386516951, 0.24518643885960564, -0.34128299121437056) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966436836" atLocation:cc3v(0.12875604412103883, 0.230872909075415, -0.31562105947093944) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966437358" atLocation:cc3v(0.1848758259808897, 0.22545833142427193, -0.28671953012926565) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966437940" atLocation:cc3v(0.19466713556361187, 0.32142714234991054, -0.2792228677671669) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966438559" atLocation:cc3v(0.08813362206454273, 0.3525344607009647, -0.3294593790136097) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966439183" atLocation:cc3v(-0.04382016714789269, 0.35932549324228746, -0.3397445275092123) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966439816" atLocation:cc3v(-0.24528806983590112, 0.1434704072473406, -0.23712989674007878) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966440325" atLocation:cc3v(-0.18018592017997492, 0.1351394642475366, -0.2886036163140057) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966440801" atLocation:cc3v(-0.02629509127899854, 0.1358580459552049, -0.33953619503068905) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966441339" atLocation:cc3v(0.0659242844550192, 0.14942837166802875, -0.3343507004343031) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966441826" atLocation:cc3v(0.14723466649354688, 0.1516963297344922, -0.3065326928813933) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966442319" atLocation:cc3v(0.2095013587580799, 0.15484883278268566, -0.2678651376936434) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966442951" atLocation:cc3v(0.26739134664823994, 0.15480552663321487, -0.2108572697510718) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966443821" atLocation:cc3v(0.2976134448660134, 0.03840173837718962, -0.16534205196335305) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966444354" atLocation:cc3v(0.18469824734443416, 0.031533848787903766, -0.28852579476382717) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966444832" atLocation:cc3v(0.08811228589767808, 0.030839300408652407, -0.3299042349925516) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966445302" atLocation:cc3v(1.2002504300173194e-8, 0.026247813447190807, -0.34282330125234106) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966445802" atLocation:cc3v(-0.0790761264351904, 0.021965597565743317, -0.33511494443256834) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966446306" atLocation:cc3v(-0.15624576267703763, 0.022320825453995156, -0.30548656622138004) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966447000" atLocation:cc3v(-0.22420060675680625, 0.022877617082008708, -0.25904666638116824) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966448104" atLocation:cc3v(0.2450364725437163, 0.027739979323685153, -0.23910974421620357) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966448921" atLocation:cc3v(0.2508863438232659, 0.0836287835708558, -0.22963749196633088) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966449340" atLocation:cc3v(0.19959211811162222, 0.08618751149805183, -0.2754520774631022) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966449841" atLocation:cc3v(0.13335875892168275, 0.0844605496134996, -0.3133572900998114) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966450370" atLocation:cc3v(0.07481084273459908, 0.08361211146113272, -0.33197967841682413) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966450855" atLocation:cc3v(0.013144925982589267, 0.08325113272842165, -0.3399028987729786) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966451341" atLocation:cc3v(-0.05710017424923476, 0.08345412599825258, -0.3354473670104025) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966451874" atLocation:cc3v(-0.11064162467436188, 0.08408765238912697, -0.32154197322795375) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966452359" atLocation:cc3v(-0.1659404842521905, 0.08521269599826331, -0.29684840170876964) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966452824" atLocation:cc3v(-0.21954348025261153, 0.08690264166564937, -0.25975568573830116) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966454033" atLocation:cc3v(-0.1333258280603289, 0.17332359714633216, -0.31381484995079023) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966454609" atLocation:cc3v(-0.05269101093066332, 0.18880952070913304, -0.33603257184028607) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966455619" atLocation:cc3v(-0.039480413542321305, 0.4255112886944053, -0.3377860644250629) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966456411" atLocation:cc3v(-0.18018592017997492, 0.59010896540513, -0.2886036163140057) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966456955" atLocation:cc3v(-0.18018592017997492, 0.6802019599416252, -0.2886036163140057) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966457931" atLocation:cc3v(-0.0350274239320129, 0.7224409290469166, -0.3412410215893982) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966458445" atLocation:cc3v(0.056839400407400695, 0.7301676389659878, -0.3438135143410681) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966458957" atLocation:cc3v(0.19372044908200492, 0.7523562053313728, -0.28840423992748243) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966459568" atLocation:cc3v(0.2729643506775616, 0.7859491010058876, -0.20451602592859258) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966460590" atLocation:cc3v(0.2913311183502911, 0.883545316519546, -0.17547457487267246) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966461207" atLocation:cc3v(0.3042568258967636, 0.9320884374478335, -0.15314116783174267) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966462541" atLocation:cc3v(-0.08401490825418229, 0.8578365926400656, -0.3231383621804474) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966463169" atLocation:cc3v(-0.14308084480254643, 0.8674277680130954, -0.30252066679465756) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966463904" atLocation:cc3v(-0.22053829539476622, 0.8913424075431342, -0.25111261604299534) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966464574" atLocation:cc3v(-0.2804019855040787, 0.9077421969550128, -0.1852096953120469) withEnvRotation:cc3v(0, 0, 0)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966465490" atLocation:cc3v(-0.2688830182173489, 0.9434493917144771, -0.19994348626868713) withEnvRotation:cc3v(0, 0, 0)];//pin saved

    [self->pins addPinViaDbWithName:@"Pin_1366966814657" atLocation:cc3v(-0.09995497457439893, 0.19515019960888613, -1.174700206536483) withEnvRotation:cc3v(-93.97773392236434, -1.211071513905539, -0.7120996746922209)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966815253" atLocation:cc3v(-0.06187328558948037, 0.20703755162748086, -1.1747580766694063) withEnvRotation:cc3v(-93.97773392236434, -1.211071513905539, -0.7120996746922209)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966815835" atLocation:cc3v(-0.011906750569401674, 0.2119401990599035, -1.1740872240427964) withEnvRotation:cc3v(-93.97773392236434, -1.211071513905539, -0.7120996746922209)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966816371" atLocation:cc3v(0.04769197528041599, 0.20984468021094788, -1.1727326220170968) withEnvRotation:cc3v(-93.97773392236434, -1.211071513905539, -0.7120996746922209)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966816926" atLocation:cc3v(0.09070802315273876, 0.20767364083852757, -1.1717089269228929) withEnvRotation:cc3v(-93.97773392236434, -1.211071513905539, -0.7120996746922209)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966817438" atLocation:cc3v(0.13396789718511098, 0.1889904337675332, -1.1695276087125772) withEnvRotation:cc3v(-93.97773392236434, -1.211071513905539, -0.7120996746922209)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966817991" atLocation:cc3v(0.1630395096031665, 0.16543716566039315, -1.1672940420393938) withEnvRotation:cc3v(-93.97773392236434, -1.211071513905539, -0.7120996746922209)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966818539" atLocation:cc3v(0.18253349101501692, 0.14650715625108474, -1.1655772280960077) withEnvRotation:cc3v(-93.97773392236434, -1.211071513905539, -0.7120996746922209)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966819043" atLocation:cc3v(0.20246554933309543, 0.10123278155584926, -1.1620126483655924) withEnvRotation:cc3v(-93.97773392236434, -1.211071513905539, -0.7120996746922209)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966819555" atLocation:cc3v(0.22246546727132785, 0.06045258071551916, -1.158760236666488) withEnvRotation:cc3v(-93.97773392236434, -1.211071513905539, -0.7120996746922209)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966820043" atLocation:cc3v(0.23552028032863126, 0.004856093407857788, -1.1546144203438753) withEnvRotation:cc3v(-93.97773392236434, -1.211071513905539, -0.7120996746922209)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966820551" atLocation:cc3v(0.2388434589331387, -0.04874355826724765, -1.1508053530804627) withEnvRotation:cc3v(-93.97773392236434, -1.211071513905539, -0.7120996746922209)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966821531" atLocation:cc3v(0.191762964278674, 0.17738074815814486, -1.167545363759517) withEnvRotation:cc3v(-93.97773392236434, -1.211071513905539, -0.7120996746922209)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966822142" atLocation:cc3v(0.2234353293633102, 0.15376196279337398, -1.1652544780975336) withEnvRotation:cc3v(-93.97773392236434, -1.211071513905539, -0.7120996746922209)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966822678" atLocation:cc3v(0.24795169426832186, 0.1324013940226912, -1.1632662807879441) withEnvRotation:cc3v(-93.97773392236434, -1.211071513905539, -0.7120996746922209)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966823171" atLocation:cc3v(0.2706828620228766, 0.08217159295594688, -1.159298924932384) withEnvRotation:cc3v(-93.97773392236434, -1.211071513905539, -0.7120996746922209)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966823724" atLocation:cc3v(0.29583644598438724, 0.04122311403623817, -1.1559303320521348) withEnvRotation:cc3v(-93.97773392236434, -1.211071513905539, -0.7120996746922209)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966824197" atLocation:cc3v(0.30183063435256463, -0.012170584983444208, -1.1520814721830361) withEnvRotation:cc3v(-93.97773392236434, -1.211071513905539, -0.7120996746922209)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966824704" atLocation:cc3v(0.3027491711480854, -0.05615508264093396, -1.1489923093731873) withEnvRotation:cc3v(-93.97773392236434, -1.211071513905539, -0.7120996746922209)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966825257" atLocation:cc3v(0.306865942175412, -0.13502100959688418, -1.1434032670498842) withEnvRotation:cc3v(-93.97773392236434, -1.211071513905539, -0.7120996746922209)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966825720" atLocation:cc3v(0.30559073246064167, -0.1922264213717698, -1.1394356907366747) withEnvRotation:cc3v(-93.97773392236434, -1.211071513905539, -0.7120996746922209)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966826258" atLocation:cc3v(0.2845463688519715, -0.25732888793556674, -1.1353175418490404) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966826845" atLocation:cc3v(0.2426377555340527, -0.3070110308658121, -1.134658924621963) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966827335" atLocation:cc3v(0.18814744505268324, -0.3144042985904215, -1.1347720193960185) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966827961" atLocation:cc3v(0.14882703209394207, -0.34974354953331926, -1.1327592410585396) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966828538" atLocation:cc3v(0.10178337453480357, -0.36989563836393335, -1.1318958186753267) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966829150" atLocation:cc3v(0.03971260367207227, -0.37726961604423503, -1.1320977578820222) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966829684" atLocation:cc3v(-0.04216954561368821, -0.38200669978208524, -1.1327125040369028) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966830203" atLocation:cc3v(-0.09905572093388433, -0.36650626735024433, -1.1344511432875628) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966830725" atLocation:cc3v(-0.14338555860959284, -0.34857531689283827, -1.1362144737949365) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966831203" atLocation:cc3v(-0.1996370639148592, -0.3130112542621372, -1.1393462951599114) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966831748" atLocation:cc3v(-0.22823998337064969, -0.25523616614303574, -1.1437092622670166) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966832266" atLocation:cc3v(-0.2642680404599665, -0.21777647085821616, -1.1467398935709947) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966832738" atLocation:cc3v(-0.2631536546003102, -0.15594293653861277, -1.1510428961975092) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966833329" atLocation:cc3v(-0.27195231228156075, -0.10683842020655865, -1.1545719822463982) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966833793" atLocation:cc3v(-0.2731789937562941, -0.043515243217149356, -1.1590060469453805) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966834328" atLocation:cc3v(-0.284323127924919, 0.002409518788603878, -1.1623402484323495) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966834836" atLocation:cc3v(-0.2659993494937895, 0.08387368446194525, -1.1678148732357019) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966835402" atLocation:cc3v(-0.23465749176115977, 0.10056750926348561, -1.1686182209094995) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966835873" atLocation:cc3v(-0.2056166607423781, 0.12671726555955404, -1.1701081839318268) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966838455" atLocation:cc3v(-0.1718971121483802, 0.15279744679938545, -1.1715392847618096) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966839392" atLocation:cc3v(-0.14060799890832892, 0.1835053785616516, -1.1733214643981926) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966840350" atLocation:cc3v(-0.2836607353605984, 0.036058573250481465, -1.164681288209533) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966841086" atLocation:cc3v(-0.30449706962001305, -0.04349958727940319, -1.1593688100071902) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966841616" atLocation:cc3v(-0.30531430612571225, -0.08238641515651937, -1.1566639048799507) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966842115" atLocation:cc3v(-0.30634202457201465, -0.13128946075438253, -1.1532623535811417) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966842724" atLocation:cc3v(-0.3044829327732561, -0.15833115425273173, -1.151353410796451) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966843297" atLocation:cc3v(-0.2910452123364447, -0.21522675413743245, -1.1472269947469704) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966844469" atLocation:cc3v(-0.22648475468188511, -0.30033852186815724, -1.1405408449322694) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966845083" atLocation:cc3v(-0.2503920226592778, -0.26266616762344824, -1.1434463665203087) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966846460" atLocation:cc3v(-0.17308160354049196, -0.35605365371284464, -1.1360353519549364) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966847565" atLocation:cc3v(-0.01988370919988154, -0.407616465734267, -1.1306676491114611) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966848151" atLocation:cc3v(0.009946991435400392, -0.4103126627843616, -1.130135023430919) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966848739" atLocation:cc3v(0.06965244376116392, -0.405476648676419, -1.129783283251571) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966849304" atLocation:cc3v(0.1417386848554253, -0.3879163701989887, -1.1301766899266237) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966849878" atLocation:cc3v(0.19354085876950014, -0.3473810426925419, -1.1324079417944901) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966851264" atLocation:cc3v(0.33348014073469623, -0.1495756649349212, -1.144599029339313) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966851819" atLocation:cc3v(0.33457857097198945, -0.09036064390126462, -1.1487194930322642) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966852277" atLocation:cc3v(0.3333387722671268, -0.03649694639667569, -1.152493507529449) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966852808" atLocation:cc3v(0.3322754223532675, 0.009701477396474029, -1.1557303769642824) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966853904" atLocation:cc3v(0.29873185407776814, 0.10118338526381844, -1.1625030564063066) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966854467" atLocation:cc3v(0.3239389541336296, 0.0556014721479058, -1.1590304075156206) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966857072" atLocation:cc3v(0.14785547523378126, 0.22178324729717958, -1.1726628471711151) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966857574" atLocation:cc3v(0.10957898435856098, 0.23106877191815364, -1.1737529000177378) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966858117" atLocation:cc3v(0.06185120537804958, 0.24264709742693888, -1.1751120214252466) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966858661" atLocation:cc3v(0.009505170193786168, 0.2495109912213324, -1.176195460542392) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966859139" atLocation:cc3v(-0.028507824704329655, 0.24706776932373034, -1.1764638677303307) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966859614" atLocation:cc3v(-0.06651117027447816, 0.24229070007975087, -1.1765691362578385) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966860915" atLocation:cc3v(-0.11412596470975869, 0.2211190772930621, -1.175641119783401) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966861702" atLocation:cc3v(-0.18810700485265244, 0.18810701863125553, -1.1741910595955842) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966862270" atLocation:cc3v(-0.2122449817599653, 0.162164719872415, -1.1726589891622536) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966862804" atLocation:cc3v(-0.23653576337540136, 0.1314087834570288, -1.170792704932689) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966863705" atLocation:cc3v(-0.04054726666601298, 0.18842553859858502, -1.1725096291048998) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966864111" atLocation:cc3v(0.011946645653448247, 0.17203179799345722, -1.1707593055988306) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966864550" atLocation:cc3v(0.055072804371097656, 0.14845715927294484, -1.1686159061041825) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966864963" atLocation:cc3v(0.10324128163707251, 0.11764705916886323, -1.1659092373157496) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966865363" atLocation:cc3v(0.1377779427293419, 0.02658873225614725, -1.159154635400962) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966865765" atLocation:cc3v(0.17793056953532685, -0.08774658799341316, -1.1507105562912934) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966866176" atLocation:cc3v(0.1913713350434183, -0.18155742855164994, -1.1440074312376016) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966866572" atLocation:cc3v(0.12787842977665656, -0.2262464675202726, -1.1416211976423258) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966867019" atLocation:cc3v(0.02460061417352556, -0.24846610463559612, -1.1412626232758516) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966867427" atLocation:cc3v(-0.10813339532744283, -0.2555880992228268, -1.1422980026254648) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966867839" atLocation:cc3v(-0.16127712981940498, -0.1808259087356924, -1.148129879049396) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966868223" atLocation:cc3v(-0.17525706584449996, -0.12657456056748623, -1.1520780550894731) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966868613" atLocation:cc3v(-0.17661490584192266, -0.03871012073730526, -1.1582266189265245) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966869039" atLocation:cc3v(-0.1322460127157926, 0.05770735939567682, -1.1644442962366097) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966869426" atLocation:cc3v(-0.05764141844600138, 0.08646213972527976, -1.1655900146396632) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966869856" atLocation:cc3v(0.019230727421462524, 0.08653829406448597, -1.1647077431274409) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966870237" atLocation:cc3v(0.13569762167958013, -0.009692685786548251, -1.1566462682680123) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966870717" atLocation:cc3v(0.2072138764110564, -0.08532336573817725, -1.1505415755031578) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966871132" atLocation:cc3v(0.22765079652447687, -0.14197577327857008, -1.146351336964225) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966871545" atLocation:cc3v(0.22904807088390577, -0.2315109824053048, -1.140085710115432) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966871989" atLocation:cc3v(0.14062515326915973, -0.27138187811417563, -1.1383235921251291) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966872404" atLocation:cc3v(0.07407060106289383, -0.29381336125180707, -1.1375263070366852) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966872806" atLocation:cc3v(-0.05674120719257292, -0.30344223488285527, -1.1383644870190615) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966873247" atLocation:cc3v(-0.19170330292735088, -0.27035085280313476, -1.1422324164748185) withEnvRotation:cc3v(-93.98394939450905, -0.7111100976753624, -0.7119954609465253)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966873646" atLocation:cc3v(-0.21371164516448962, -0.09957021397277707, -1.1544068594671244) withEnvRotation:cc3v(-93.48394539631828, -0.7048699194557624, -0.7181736872159191)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966874087" atLocation:cc3v(-0.21210951053451288, 0.021693024072699237, -1.1619996413642877) withEnvRotation:cc3v(-93.48394539631828, -0.7048699194557624, -0.7181736872159191)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966874526" atLocation:cc3v(-0.18985457263810623, 0.07449990788826343, -1.1649658990346903) withEnvRotation:cc3v(-93.48394539631828, -0.7048699194557624, -0.7181736872159191)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966875024" atLocation:cc3v(-0.1439754895003318, 0.10798163090385193, -1.166480112398433) withEnvRotation:cc3v(-93.48394539631828, -0.7048699194557624, -0.7181736872159191)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966875462" atLocation:cc3v(-0.06235704545421001, 0.13190915342776768, -1.1669987390182488) withEnvRotation:cc3v(-93.48394539631828, -0.7048699194557624, -0.7181736872159191)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966875854" atLocation:cc3v(-0.007196450283026319, 0.13913140113098613, -1.1668030828545564) withEnvRotation:cc3v(-93.48394539631828, -0.7048699194557624, -0.7181736872159191)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966876838" atLocation:cc3v(0.009860442001335318, -0.31060399451856596, -1.139156370895099) withEnvRotation:cc3v(-92.48395106031505, -0.69222910693192, -0.7303656816060977)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966877495" atLocation:cc3v(-0.03419697374596296, -0.20762447878274906, -1.14852714373331) withEnvRotation:cc3v(-92.48395106031505, -0.69222910693192, -0.7303656816060977)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966878340" atLocation:cc3v(-0.06805999548915025, -0.11667426223442548, -1.153501109215259) withEnvRotation:cc3v(-91.9839607225026, -0.6858293264013238, -0.7363783825098246)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966879012" atLocation:cc3v(-0.09445444599726195, 0.009687636789683247, -1.1571730518208498) withEnvRotation:cc3v(-88.4840283578155, -0.6395966830440066, -0.7768721194995972)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966881714" atLocation:cc3v(-0.11544119437716598, 0.36684651617462616, -1.0973493334390634) withEnvRotation:cc3v(-76.03907535040459, 1.8827209407030931, -1.7771063658974207)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966882148" atLocation:cc3v(-0.08984616464097495, 0.372219868245363, -1.0966513645215983) withEnvRotation:cc3v(-76.03907535040459, 1.8827209407030931, -1.7771063658974207)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966882565" atLocation:cc3v(-0.020499629980674373, 0.3715560427063225, -1.0985606379927628) withEnvRotation:cc3v(-76.03907535040459, 1.8827209407030931, -1.7771063658974207)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966882977" atLocation:cc3v(0.02030507782755344, 0.33503354044558986, -1.1087038944338792) withEnvRotation:cc3v(-76.03907535040459, 1.8827209407030931, -1.7771063658974207)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966883323" atLocation:cc3v(0.04213800294659433, 0.23795573109409796, -1.1334870819874758) withEnvRotation:cc3v(-76.03907535040459, 1.8827209407030931, -1.7771063658974207)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966883730" atLocation:cc3v(-0.019785925898495305, 0.22259176194713104, -1.1357656220211023) withEnvRotation:cc3v(-76.03907535040459, 1.8827209407030931, -1.7771063658974207)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966884185" atLocation:cc3v(-0.05533641660516557, 0.28925859598987086, -1.1182293183130259) withEnvRotation:cc3v(-76.03907535040459, 1.8827209407030931, -1.7771063658974207)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966884583" atLocation:cc3v(-0.08856599462909694, 0.31124624276518803, -1.1119049395007128) withEnvRotation:cc3v(-76.03907535040459, 1.8827209407030931, -1.7771063658974207)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966885059" atLocation:cc3v(-0.010101391016829754, 0.31061815892252903, -1.1140344501634591) withEnvRotation:cc3v(-76.03907535040459, 1.8827209407030931, -1.7771063658974207)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966885732" atLocation:cc3v(0.07745855976976748, 0.27485292868690475, -1.1251642545848841) withEnvRotation:cc3v(-76.03907535040459, 1.8827209407030931, -1.7771063658974207)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966886721" atLocation:cc3v(0.05155955338179466, 0.40474235936124303, -1.0920877809536929) withEnvRotation:cc3v(-76.03907535040459, 1.8827209407030931, -1.7771063658974207)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966887263" atLocation:cc3v(0.11141788361451023, 0.4327158997856853, -1.086609518599128) withEnvRotation:cc3v(-76.03907535040459, 1.8827209407030931, -1.7771063658974207)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966887865" atLocation:cc3v(0.08856402428885693, 0.2115695959729432, -1.1412413491127007) withEnvRotation:cc3v(-76.03907535040459, 1.8827209407030931, -1.7771063658974207)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966888514" atLocation:cc3v(0.012209252049491548, 0.17337129867018453, -1.148857389291858) withEnvRotation:cc3v(-76.03907535040459, 1.8827209407030931, -1.7771063658974207)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966889128" atLocation:cc3v(-0.05619132381167707, 0.16857398865828505, -1.1483352353496545) withEnvRotation:cc3v(-76.03907535040459, 1.8827209407030931, -1.7771063658974207)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966889641" atLocation:cc3v(-0.14456110768830768, 0.17151318515224448, -1.1453796698752396) withEnvRotation:cc3v(-76.03907535040459, 1.8827209407030931, -1.7771063658974207)];//pin saved
    [self->pins addPinViaDbWithName:@"Pin_1366966890286" atLocation:cc3v(-0.1581914805533408, 0.3393462707658766, -1.10313954336729) withEnvRotation:cc3v(-76.03907535040459, 1.8827209407030931, -1.7771063658974207)];//pin saved

}

#define ZOOM 2.0f
-(void) initializeScene
{
	// This is the simplest way to load a POD resource file and add the
	// nodes to the CC3Scene, if no customized resource subclass is needed.
	//[self addContentFromPODFile: @"hello-world.pod" withName:ObjectName];
	[self addContentFromPODFile: @"oilDrum-anim-noinvert-tryColor.pod" withName:ObjectName];
	//[self addContentFromPODFile: @"skull2.pod" withName:ObjectName];

    //CC3MeshNode *cube = [[CC3MeshNode alloc] init];
    //[cube populateAsSolidBox:CC3BoundingBoxMake(0.0f, 0.0f, 0.0f, 15.0f, 15.0f, 15.0f)];
    //[cube setLocation:cc3v(0.48556034235091183, -0.28250785208394513, -0.32632973466792087)];
    //[cube setColor:ccGRAY ];
    //self->Dobj = cube;
    self->Dobj = (CC3PODResourceNode*)[self getNodeNamed:ObjectName];
    //self->Dobj.shaderProgram = [self programFromVertexShaderFile: @"CC3NoTexture.vsh" andFragmentShaderFile: @"CC3NoTexture.fsh"];
	self->cam = [CC3Camera nodeWithName:@"camera"];
	self->light = [CC3Light nodeWithName:@"light"];
    self->eye = [CC3Node nodeWithName:@"eye"];
    self->container = [CC3Node nodeWithName:@"container"];
    self->pins = [[Pin alloc] initWithParent:self->container];
    [self addPins];

    /**
     * we ensure everyone is located in 0,0,0
     */
    [self->Dobj setLocation:cc3v(0.0f, 0.0f, 0.0f)];
    [self->container setLocation:cc3v(0.0f, 0.0f, 0.0f)];
    [self->eye setLocation:cc3v(0.0f, 0.0f, 0.0f)];
    [self->cam setLocation:cc3v(0.0f, 0.0f, 0.0f)];
    [self->light setLocation:cc3v(0.0f, 0.0f, 0.0f)];

    /**
     * We put the cam and light into the eye
     * If the eye is moving, the light and cam will do the same
     */
	[self->eye addChild: self->cam];
	[self->eye addChild: self->light];

    /**
     * We get the maximum width/depth/high
     * on any of the X/Y/Z axis
     */
    CGFloat maxDepth = MAX(
                           MAX(self->Dobj.boundingBox.maximum.z - self->Dobj.boundingBox.minimum.z,
                               self->Dobj.boundingBox.maximum.y - self->Dobj.boundingBox.minimum.y),
                           self->Dobj.boundingBox.maximum.x - self->Dobj.boundingBox.minimum.x);
    NSLog(@"self->Dobj.boundingBox.depth.z(%f)", self->Dobj.boundingBox.maximum.z - self->Dobj.boundingBox.minimum.z);
    /**
     * We set the cam position on the Z axis
     * to be sure we have the complete object
     * on screen
     */
    //CGFloat camZ = maxDepth*ZOOM;
    CGSize windowSize = [[CCDirector sharedDirector] winSize];
    CGFloat ratio = MIN(1.0f, (MIN(windowSize.height, windowSize.width)/maxDepth)/8);
    //[self->Dobj setScale:cc3v(ratio, ratio, ratio)];
    CGFloat camZ = maxDepth*ratio*2.5;
    NSLog(@"ratio=(%f) maxDepth(%f)*r(%f) camZ(%f)", ratio, maxDepth, maxDepth*ratio, camZ);

    [self->pins setScale:ratio];
    [self->pins renderPins];
    /**
     * Eye set to 0x/0y/camZ position
     * We set the eye to be at camZ away from the object
     */
	[self->eye setLocation:cc3v(0.0f, 0.0f, camZ)];
    /**
     * The light is directional to act like a "sun"
     * A directional-only light is not subject to
     * attenuation over distance
     */
    [self->light setLocation:cc3v(0.0f, 0.0f, -1.0f)];
    self->light.isDirectionalOnly = YES;
	//self.ambientLight = kCCC4FWhite;
    /**/[self->Dobj addAxesDirectionMarkers];
    /**/[self->container addAxesDirectionMarkers];
    /**
     * we get the center of the 3D object
     */
    CC3Vector objCenter = self->Dobj.centerOfGeometry;
    /**
     * We get a wrapper from the Dobj to use it as a black box
     */
    //self->container = [self->Dobj asOrientingWrapper];
    [self->container addChild:self->Dobj];
    self->container.uniformScale = ratio;
    /**
     * Container set to the center of the Loaded object
     */
    CC3Vector maskOffset = CC3VectorScaleUniform(self->Dobj.location, self->container.uniformScale);
	self->Dobj.location = CC3VectorDifference(maskOffset, objCenter);

    /**
     * We add the eye and the object to the scene
     */
	[self addChild: self->eye];
    [self addChild: self->container];

	// Create OpenGL ES buffers for the vertex arrays to keep things fast and efficient,
	// and to save memory, release the vertex content in main memory because it is now redundant.
	[self createGLBuffers];
	[self releaseRedundantContent];

	// Displays bounding boxes around those nodes with local content (eg- meshes).
	//self.shouldDrawAllLocalContentWireframeBoxes = YES;

    
    
	// Displays bounding boxes around all nodes. The bounding box for each node
	// will encompass its child nodes.
	//self.shouldDrawAllWireframeBoxes = YES;

    /**
     * Set this parameter to adjust the rate of camera movement during a pinch gesture. ZOOM
     */
    ZoomRate = maxDepth/2.5;
    /**
     * Set this parameter to adjust the rate of camera movement during a double pan gesture. X Y translation
     */
    TranslationXYRate = maxDepth/600;
    /**
     * Set this parameter to adjust the rate of camera movement during a pan gesture. X Y rotation 
     */
    RotationXYRate = 1/1.7;
}


#pragma mark Updating custom activity

/**
 * This template method is invoked periodically whenever the 3D nodes are to be updated.
 *
 * This method provides your app with an opportunity to perform update activities before
 * any changes are applied to the transformMatrix of the 3D nodes in the scene.
 *
 * For more info, read the notes of this method on CC3Node.
 */
-(void) updateBeforeTransform: (CC3NodeUpdatingVisitor*) visitor {}

/**
 * This template method is invoked periodically whenever the 3D nodes are to be updated.
 *
 * This method provides your app with an opportunity to perform update activities after
 * the transformMatrix of the 3D nodes in the scen have been recalculated.
 *
 * For more info, read the notes of this method on CC3Node.
 */
-(void) updateAfterTransform: (CC3NodeUpdatingVisitor*) visitor {
	// If you have uncommented the moveWithDuration: invocation in the onOpen: method, you
	// can uncomment the following to track how the camera moves, where it ends up, and what
	// the camera's clipping distances are, in order to determine how to position and configure
	// the camera to view the entire scene.
	//LogDebug(@"Camera: %@", activeCamera.fullDescription);
}


#pragma mark Scene opening and closing

/**
 * Callback template method that is invoked automatically when the CC3Layer that
 * holds this scene is first displayed.
 *
 * This method is a good place to invoke one of CC3Camera moveToShowAllOf:... family
 * of methods, used to cause the camera to automatically focus on and frame a particular
 * node, or the entire scene.
 *
 * For more info, read the notes of this method on CC3Scene.
 */
-(void) onOpen {

	// Move the camera to frame the scene. You can uncomment the LogDebug line in the
	// updateAfterTransform: method to track how the camera moves, where it ends up, and
	// what the camera's clipping distances are, in order to determine how to position
	// and configure the camera to view your entire scene. Then you can remove this code.
	//[self.activeCamera moveWithDuration: 1.5 toShowAllOf: self withPadding: 0.1f];

	// Uncomment this line to draw the bounding box of the scene.
	//self.shouldDrawWireframeBox = YES;
}

/**
 * Callback template method that is invoked automatically when the CC3Layer that
 * holds this scene has been removed from display.
 *
 * For more info, read the notes of this method on CC3Scene.
 */
-(void) onClose {}


#pragma mark Handling touch events 

/**
 * This method is invoked from the CC3Layer whenever a touch event occurs, if that layer
 * has indicated that it is interested in receiving touch events, and is handling them.
 *
 * Override this method to handle touch events, or remove this method to make use of
 * the superclass behaviour of selecting 3D nodes on each touch-down event.
 *
 * This method is not invoked when gestures are used for user interaction. Your custom
 * CC3Layer processes gestures and invokes higher-level application-defined behaviour
 * on this customized CC3Scene subclass.
 *
 * For more info, read the notes of this method on CC3Scene.
 */
-(void) touchEvent: (uint) touchType at: (CGPoint) touchPoint {}

/**
 * This callback template method is invoked automatically when a node has been picked
 * by the invocation of the pickNodeFromTapAt: or pickNodeFromTouchEvent:at: methods,
 * as a result of a touch event or tap gesture.
 *
 * Override this method to perform activities on 3D nodes that have been picked by the user.
 *
 * For more info, read the notes of this method on CC3Scene.
 */
-(void) nodeSelected: (CC3Node*) aNode byTouchEvent: (uint) touchType at: (CGPoint) touchPoint {}



#pragma mark Gesture handling

/**
 * PINCH GESTURE
 */
-(void) startMovingObject
{
    NSLog(@"TRANSLATION Z");
    self->objectZAxisStartLocation = self->eye.location;
}
-(void) moveObjectBy:  (CGFloat) aMovement
{
	// Convert to a logarithmic scale, zero is backwards, one is unity, and above one is forward.
	GLfloat camMoveDist = logf(aMovement) * self->ZoomRate;
	CC3Vector moveVector = CC3VectorScaleUniform(self->eye.globalForwardDirection, camMoveDist);
	self->eye.location = CC3VectorAdd(self->objectZAxisStartLocation, moveVector);
    
    //NSLog(@"SCENE:WIDTH=%f OBJ:WIDTH=%f",
    //      self.boundingBox.maximum.x - self.boundingBox.minimum.x, Dobj.boundingBox.maximum.x - Dobj.boundingBox.minimum.x);
}
-(void) stopMovingObject
{
    NSLog(@"TRANSLATION Z END");
}

/**
 * ROTATION GESTURE
 */
-(void) startRotatingObjectOnZAxis
{
    NSLog(@"ROTATION Z START");
    self->objectZAxisStartRotation = CC3VectorMake(0.0f, 0.0f, 0.0f);
}
-(void) rotateObjectOnZAxisBy: (CGFloat) aMovement
{
	CC3Vector rotateVector = CC3VectorMake(0.0f, 0.0f, aMovement * 60);
    [self->container rotateBy:CC3VectorDifference(self->objectZAxisStartRotation, rotateVector)];
    self->objectZAxisStartRotation = rotateVector;
}
-(void) stopRotatingObjectOnZAxis
{
    NSLog(@"ROTATION Z END");
}

/**
 * PAN GESTURE
 */
-(void) startRotatingObjectOnXYAxis
{
    NSLog(@"ROTATION XY START");
    self->objectXYAxisStartRotation =  CC3VectorMake(0.0f, 0.0f, 0.0f);
}
-(void) rotateObjectOnXYAxisBy: (CGPoint) aMovement
{
	CC3Vector rotateVector = CC3VectorMake(aMovement.y * self->RotationXYRate,
                                           aMovement.x * self->RotationXYRate,
                                           0.0f);
    [self->container rotateBy:CC3VectorDifference(rotateVector, self->objectXYAxisStartRotation)];
    self->objectXYAxisStartRotation = rotateVector;
}
-(void) stopRotatingObjectOnXYAxisAtPoint:(CGPoint)finalPoint
                             withDuration:(CGFloat)duration
{
    NSLog(@"ROTATION XY END");
    //UIViewAnimationOptionCurveEaseOut
}

-(void) startMovingObjectOnXYAxis
{
    NSLog(@"TRANSLATION XY");
    self->objectXYAxisStartMove =  CC3VectorMake(0.0f, 0.0f, 0.0f);
}
-(void) moveObjectOnXYAxisBy: (CGPoint) aMovement
{
    //NSLog(@"ORI X:%f, Y:%f, Z:%f", objectXYAxisStartMove.x, objectXYAxisStartMove.y, objectXYAxisStartMove.z);
	CC3Vector translateVector = CC3VectorMake(aMovement.x  * self->TranslationXYRate,
                                              -aMovement.y * self->TranslationXYRate,
                                              0.0f);
    //CC3Vector by = CC3VectorDifference(translateVector, objectXYAxisStartMove);
    //NSLog(@"BY X:%f, Y:%f, Z:%f", by.x, by.y, by.z);
    [self->container translateBy:CC3VectorDifference(translateVector, self->objectXYAxisStartMove)];
     self->objectXYAxisStartMove = translateVector;
}
-(void) stopMovingObjectOnXYAxis
{
    NSLog(@"TRANSLATION XY END");
}

@end

