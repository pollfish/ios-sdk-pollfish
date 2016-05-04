//
//  UserAttributesDictionary.h
//
//  Created by Pollfish on 10/03/15.
//  Copyright (c) 2015 Pollfish. All rights reserved.
//

#import <Foundation/Foundation.h>



typedef enum {
    MALE,
    FEMALE,
    OTHER
} GENDER_VALUE;

typedef enum {
    WHITE,
    CAUCASIAN,
    BLACK_AFRICAN,
    HISPANIC_LATINO,
    ASIAN_PACIFIC_ISLANDER,
    ARABIC_MIDDLE_EASTERN,
    AMERICAN_INDIAN_ALASKA_NATIVE_NATIVE_HAWAIIAN,
    OTHER_RACE
} RACE_VALUE;

typedef enum {
    _12_17,
    _18_24,
    _25_34,
    _35_44,
    _45_54,
    _55_64,
    _65_plus,
    OTHER_GROUP
} AGE_GROUP_VALUE;

typedef enum {
    _12=0,
    _13,
    _14,
    _15,
    _16,
    _17,
    _18,
    _19,
    _20,
    _21,
    _22,
    _23,
    _24,
    _25,
    _26,
    _27,
    _28,
    _29,
    _30,
    _31,
    _32,
    _33,
    _34,
    _35,
    _36,
    _37,
    _38,
    _39,
    _40,
    _41,
    _42,
    _43,
    _44,
    _45,
    _46,
    _47,
    _48,
    _49,
    _50,
    _51,
    _52,
    _53,
    _54,
    _55,
    _56,
    _57,
    _58,
    _59,
    _60,
    _61,
    _62,
    _63,
    _64,
    _65,
    _66,
    _67,
    _68,
    _69,
    _70,
    OTHER_AGE
} AGE_VALUE;


typedef enum {
    ANNULED,
    DIVORCED,
    INTERLOCUTORY,
    LEGALLY,
    SEPERATED,
    MARRIED,
    POLYGAMOUS,
    NEVER_MARRIED,
    DOMESTIC_PARTNER,
    WIDOWED,
    OTHER_MARRITAL_STATUS
} MARITAL_STATUS_VALUE;

typedef enum {
    CATHOLIC,
    CHRISTIAN,
    PROTESTANT_CHRISTIAN,
    ORTHODOX_CHRISTIAN,
    ANGLICAN_CHRISTIAN,
    MUSLIM,
    HINDU,
    BUDDHIST,
    BAHAI,
    SECULAR,
    NON_RELIGIOUS,
    AGNOSTIC,
    ATHEIST,
    OTHER_RELIGION
} RELIGION_VALUE;

typedef enum {
    DEMOCRATIC_PARTY,
    REPUBLICAN_PARTY,
    LIBERTARIAN_PARTY,
    GREEN_PARTY,
    CONSTITUTION_PARTY,
    OTHER_POLITICAL_VIEW
} POLITICAL_VIEW_VALUE;

typedef enum {
    _1950,
    _1951,
    _1952,
    _1953,
    _1954,
    _1955,
    _1956,
    _1957,
    _1958,
    _1959,
    _1960,
    _1961,
    _1962,
    _1963,
    _1964,
    _1965,
    _1966,
    _1967,
    _1968,
    _1969,
    _1970,
    _1971,
    _1972,
    _1973,
    _1974,
    _1975,
    _1976,
    _1977,
    _1978,
    _1979,
    _1980,
    _1981,
    _1982,
    _1983,
    _1984,
    _1985,
    _1986,
    _1987,
    _1988,
    _1989,
    _1990,
    _1991,
    _1992,
    _1993,
    _1994,
    _1995,
    _1996,
    _1997,
    _1998,
    _1999,
    _2000,
    _2001,
    _2002,
    _2003,
    _2004,
    _2005,
    _2006,
    _2007,
    OTHER_YEAR
} YEAR_OF_BIRTH_VALUE;

typedef enum {
    
    AFGHAN,
    ARGENTINE,
    AUSTRALIAN,
    BELGIAN,
    BOLIVIAN,
    BRAZILIAN,
    COMODIAN,
    CAMEROONIAN,
    CANADIAN,
    CHILEAN,
    CHINESE,
    COLOMBIAN,
    COSTA_RICAN,
    CYPRIOT,
    DANISH,
    DOMINICAN,
    ECUADORIAN,
    EGYPTIAN,
    SALVADORIAN,
    ENGLISH,
    ESTHONIAN,
    ETHIPIAN,
    FINNISH,
    FRENCH,
    GERMAN,
    GHANAIAN,
    GREEK,
    GUATEMALAN,
    HAITIAN,
    HONDURAN,
    INDONESIAN,
    IRANINA,
    IRISH,
    ISRAELI,
    ITALIAN,
    JAPANESE,
    JORDANIAN,
    KENYAN,
    KOREAN,
    LAOTIAN,
    LATVIAN,
    LITHUANIAN,
    MALAYSIAN,
    MEXICAN,
    MOROCCAN,
    DUTCH,
    NEW_ZEALANDER,
    NICARAGUAN,
    NORWEGIAN,
    PANAMANIAN,
    PARAGUAYAN,
    PERUVIAN,
    FILIPINO,
    POLISH,
    PORTUGUESE,
    PUERTO_RICAN,
    ROMANIAN,
    RUSSIAN,
    SAUDI,
    SPANISH,
    SWEDISH,
    SWISS,
    TAIWANESE,
    TAJIK,
    THAI,
    TURKISH,
    UKRAINIAN,
    AMERICAN,
    URUGUANYAN,
    VENEZUELAN,
    VIETNAMESE,
    WELSH,
    OTHER_NATIONALITY
    
} NATIONALITY_VALUE;

typedef enum {
    
    AFGANISTAN,ARGENTINA,AUSTRALIA,BELIGUM,BOLIVIA,BRAZIL,
    CAMBODIA,CAMEROON,CANADA,CHILE,CHINA,COLOMBIA,
    COSTA_RICA,CUBA,CYPRUS,DENMARK,DOMINICAN_REPUBLIC,
    REPUBLIC_ECUADOR,EGYPT,EL_SLAVADOR,ENGLAND,ESTONIA,
    ETHIOPIA,FINLAND,FRANCE,GERMANY,GHANA,GREECE,
    GUATEMALA,HAITI,HONDURAS,INDONESIA,IRAN,IRELAND,
    ISRAEL,ITALY,JAPAN,JORDAN,KENYA,KOREA,LAOS,LATVIA,
    LITHUANIA,MALAYSIA,MEXICO,MOROCCO,NETHERLNADS,NEW_ZEALAND,
    NICARAGUA,NORWAY,PANAMA,PARAGUAY,PERU,PHILIPPINES,POLAND,
    PORTUGAL,PUERTO_RICO,ROMANIA,RUSSIA,SAUDI_ARABIA,SPAIN,SWEDEN,
    SWITZERLAND,TAIWAN,TAJIKISTAN,THAILAND,TURKEY,UKRAINE,UNITED_STATES,
    URUGUAY,VENEZUELA,VIETNAM,WALES,OTHER_COUNTRY
    
} COUNTRY_VALUE;


NSString *GENDER(GENDER_VALUE gender);
NSString *RACE(RACE_VALUE race);
NSString *AGE_GROUP(AGE_GROUP_VALUE age_group);
NSString *AGE(AGE_VALUE age_value);
NSString *MARITAL_STATUS(MARITAL_STATUS_VALUE marital_status);
NSString *RELIGION(RELIGION_VALUE religion);
NSString *POLITICAL_VIEW(POLITICAL_VIEW_VALUE political_view);
NSString *YEAR_OF_BIRTH(YEAR_OF_BIRTH_VALUE year_of_birth);
NSString *NATIONALITY(NATIONALITY_VALUE nationality);
NSString *COUNTRY(COUNTRY_VALUE country);


@interface UserAttributesDictionary : NSMutableDictionary
{
    NSMutableDictionary *_dict;
}

- (id)init;
- (id)initWithObjects:(const id [])objects
              forKeys:(const id<NSCopying> [])keys
                count:(NSUInteger)count;
- (id)objectForKey:(id)aKey;
- (NSEnumerator *)keyEnumerator;
- (void)setObject:(id)anObject forKey:(id)aKey;
- (void)removeObjectForKey:(id)aKey;
- (NSUInteger)count;
- (void)dealloc;


/**
 * Add user's facebook id
 *
 */
- (UserAttributesDictionary *) setFacebookId: (NSString*) facebook_id;

/**
 * Add user's twitter id
 *
 * @param twitter_id
 */
- (UserAttributesDictionary *) setTwitterId: (NSString*) twitter_id;

/**
 * Add custom attributes
 *
 * @param attr_key
 * @param attr_value
 */
- (UserAttributesDictionary *) setCustomAtributesWithKey: (NSString*) attr_key andAttrValue: (NSString*)  attr_value;
    
/**
 * Add user's linkedin id
 *
 * @param linkedin_id
 */
- (UserAttributesDictionary *) setLinkedInId: (NSString *) linkedin_id;
    
/**
 * Add user's google id
 *
 * @param google_id
 */
- (UserAttributesDictionary *) setGoogleId: (NSString *) google_id;
    
/**
 * Add user's email
 *
 * @param email
 */
- (UserAttributesDictionary *) setEmail: (NSString *) email;
    
/**
 * Add user's phone
 *
 * @param phone
 */
- (UserAttributesDictionary *) setPhone: (NSString *) phone;
  
/**
 * Add user's name
 *
 * @param name
 */
- (UserAttributesDictionary *) setName: (NSString *) name;
   
/**
 * Add user's surname
 *
 * @param surname
 */
- (UserAttributesDictionary *) setSurname: (NSString *) surname;

/**
 * Add user's age
 *
 * @param age NSString of class AGE eg. AGE(_23)
 */
- (UserAttributesDictionary *) setAge: (NSString *) age;

/**
 * Add user's gender
 *
 * @param gender NSString of class GENDER, for example: GENDER(MALE)
 */
- (UserAttributesDictionary *) setGender: (NSString *) gender;

/**
 * Add user's age group
 *
 * @param age_group NSString of class AGE_GROUP, for example: AGE_GROUP(_12_27)
 */
- (UserAttributesDictionary *) setAgeGroup: (NSString *) age_group;
    
/**
 * Add user's year of birth
 *
 * @param year_of_birth NSString of class YEAR_OF_BIRTH, for example: YEAR_OF_BIRTH(_1984)
 */
- (UserAttributesDictionary *) setYearOfBirth: (NSString *) year_of_birth;

/**
 * Add user's place of birth
 *
 * @param place_of_birth NSString of class COUNTRY, for example: COUNTRY(CYPRUS)
 */
- (UserAttributesDictionary *)  setPlaceOfBirth: (NSString *)  place_of_birth;

/**
 * Add user's place of residence
 *
 * @param place_of_residence NSString of class COUNTRY, for example: COUNTRY(CYPRUS)
 */
- (UserAttributesDictionary *)  setPlaceOfRecidence: (NSString *)  place_of_residence;

/**
 * Add user's nationality
 *
 * @param nationality NSString of class NATIONALITY, for example: NATIONALITY(COLOMBIAN)
 */
- (UserAttributesDictionary *)  setNationality: (NSString *)  nationality;
  
/**
 * Add user's marital status
 *
 * @param marital_status NSString of class MARITAL_STATUS, for example: MARITAL_STATUS(DIVORCED)
 */
- (UserAttributesDictionary *)  setMaritalStatus: (NSString *)  marital_status;

/**
 * Add user's religion
 *
 * @param religion NSString of class RELIGION, for example: RELIGION(CHRISTIAN)
 */
- (UserAttributesDictionary *)  setReligion: (NSString *)  religion;

/**
 * Add user's political views
 *
 * @param political_view  NSString of class POLITICAL_VIEW(REPUBLICAN_PARTY)
 */
- (UserAttributesDictionary *)  setPoliticalView: (NSString *)  political_view;


/**
 * Add user's race
 *
 * @param race NSString of class RACE, for example:RACE(WHITE)
 */
- (UserAttributesDictionary *)  setRace: (NSString *)  race;

@end