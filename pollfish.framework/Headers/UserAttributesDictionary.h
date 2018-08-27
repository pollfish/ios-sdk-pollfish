//
//  UserAttributesDictionary.h
//
//  Copyright (c) 2017 Pollfish. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef enum {
    FEMALE,
    MALE,
    OTHER
} GENDER_VALUE;



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
    _2008,
    _2009,
    _2010,
    _2011,
    _2012,
    _2013,
    _2014,
    _2015,
    _2016,
    _2017
} YEAR_OF_BIRTH_VALUE;

typedef enum {
    SINGLE,
    MARRIED,
    DIVORCED,
    LIVING_WITH_PARTNER,
    SEPARATED,
    WIDOWED,
    PREFER_NOT_TO_SAY
} MARITAL_STATUS_VALUE;

typedef enum {
    ZERO,
    ONE,
    TWO,
    THREE,
    FOUR,
    FIVE,
    SIX_OR_MORE,
    PREFER_NOT_TO_SAY_PARENTAL
} PARENTAL_STATUS_VALUE;

typedef enum {
    ELEMENTARY_SCHOOL,
    MIDDLE_SCHOOL,
    HIGH_SCHOOL,
    VOCATIONAL_TECHNICAL_COLLEGE,
    UNIVERSITY,
    POST_GRADUATE
} EDUCATION_LEVEL_VALUE;

typedef enum {
    EMPLOYED_FOR_WAGES,
    SELF_EMPLOYED,
    UNEMPLOYED_LOOKING,
    UNEMPLOYED_NOT_LOOKING,
    HOMEMAKER,
    STUDENT,
    MILITARY,
    RETIRED,
    UNABLE_TO_WORK,
    OTHER_STATUS
} EMPLOYMENT_STATUS_VALUE;

typedef enum {
    AGRICULTURE_FORESTRY_FISHING_OR_HUNTING,
    ARTS_ENTERTAINMENT_OR_RECREATION,
    BROADCASTING,
    CONSTRUCTION,
    EDUCATION,
    FINANCE_AND_INSURANCE,
    GOVERNMENT_AND_PUBLIC_ADMINISTRATION,
    HEALTH_CARE_AND_SOCIAL_ASSISTANCE,
    HOMEMAKER_,
    HOTEL_AND_FOOD_SERVICES,
    INFORMATION_OTHER,
    INFORMATION_SERVICES_AND_DATA,
    LEGAL_SERVICES,
    MANUFACTURING_COMPUTER_AND_ELECTRONICS,
    MANUFACTURING_OTHER,
    MILITARY_,
    MINING,
    PROCESSING,
    PUBLISHING,
    REAL_ESTATE_RENTAL_OR_LEASING,
    RELIGIOUS,
    RETAIL,
    RETIRED_,
    SCIENTIFIC_OR_TECHNICAL_SERVICES,
    SOFTWARE,
    STUDENT_,
    TELECOMMUNICATIONS,
    TRANSPORTATION_AND_WAREHOUSING,
    UNEMPLOYED,
    UTILITIES,
    WHOLESALE,
    OTHER_CAREER
} CAREER_VALUE;



typedef enum {
    ARAB,
    ASIAN,
    BLACK,
    WHITE,
    HISPANIC,
    LATINO,
    MULTIRACIAL,
    OTHER_RACE,
    PREFER_NOT_TO_SAY_RACE
} RACE_VALUE;

typedef enum {
    LOWER_I,
    LOWER_II,
    MIDDLE_I,
    MIDDLE_II,
    HIGH_I,
    HIGH_II,
    HIGH_III,
    PREFER_NOT_TO_SAY_INCOME
} INCOME_VALUE;



NSString *GENDER(GENDER_VALUE gender);
NSString *YEAR_OF_BIRTH(YEAR_OF_BIRTH_VALUE year_of_birth);
NSString *MARITAL_STATUS(MARITAL_STATUS_VALUE marital_status);
NSString *PARENTAL_STATUS(PARENTAL_STATUS_VALUE parental_status);
NSString *EDUCATION_LEVEL(EDUCATION_LEVEL_VALUE education);
NSString *EMPLOYMENT_STATUS(EMPLOYMENT_STATUS_VALUE employment);
NSString *CAREER(CAREER_VALUE career);
NSString *RACE(RACE_VALUE race);
NSString *INCOME(INCOME_VALUE income);


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
 * Add user's gender
 *
 * @param gender NSString of class GENDER, for example: GENDER(MALE)
 */
- (UserAttributesDictionary *) setGender: (NSString *) gender;



/**
 * Add user's year of birth
 *
 * @param year_of_birth NSString of class YEAR_OF_BIRTH, for example: YEAR_OF_BIRTH(_1984)
 */
- (UserAttributesDictionary *) setYearOfBirth: (NSString *) year_of_birth;


/**
 * Add user's marital status
 *
 * @param marital_status NSString of class MARITAL_STATUS, for example: MARITAL_STATUS(DIVORCED)
 */
- (UserAttributesDictionary *)  setMaritalStatus: (NSString *)  marital_status;


/**
 * Add user's parental status
 *
 * @param parental_status NSString of class PARENTAL_STATUS, for example: PARENTAL_STATUS(TWO)
 */

- (UserAttributesDictionary *)  setParentalStatus: (NSString *)  parental_status;

/**
 * Add user's education level
 *
 * @param education_level NSString of class EDUCATION_LEVEL, for example: EDUCATION_LEVEL(HIGH_SCHOOL)
 */

- (UserAttributesDictionary *)  setEducation: (NSString *)  education_level;


/**
 * Add user's employment status
 *
 * @param employment_status NSString of class EMPLOYMENT_STATUS, for example: EMPLOYMENT_STATUS(RETIRED)
 */

- (UserAttributesDictionary *)  setEmployment: (NSString *)  employment_status;


/**
 * Add user's career status
 *
 * @param career_status NSString of class CAREER, for example: CAREER(INFORMATION_SERVICES_AND_DATA)
 */
- (UserAttributesDictionary *)  setCareer: (NSString *)  career_status;


/**
 * Add user's race
 *
 * @param race NSString of class RACE, for example:RACE(WHITE)
 */
- (UserAttributesDictionary *)  setRace: (NSString *)  race;


/**
 * Add user's income
 *
 * @param income NSString of class INCOME, for example:INCOME(MIDDLE_II)
 */

- (UserAttributesDictionary *)  setIncome: (NSString *)  income;

/**
 * Add user's email
 *
 * @param email User's email id
 */
- (UserAttributesDictionary *) setEmail: (NSString *) email;



/**
 * Add user's google id
 *
 * @param google_id User's google id
 */
- (UserAttributesDictionary *) setGoogleId: (NSString *) google_id;

/**
 * Add user's linkedin id
 *
 * @param linkedin_id User's linkedin id
 */
- (UserAttributesDictionary *) setLinkedInId: (NSString *) linkedin_id;

/**
 * Add user's twitter id
 *
 * @param twitter_id User's twitter id
 */
- (UserAttributesDictionary *) setTwitterId: (NSString*) twitter_id;

/**
 * Add user's facebook id
 * 
 * @param facebook_id User's facebook id
 *
 */
- (UserAttributesDictionary *) setFacebookId: (NSString*) facebook_id;


/**
 * Add custom attributes
 *
 * @param attr_key User's custom attribute key
 * @param attr_value User's custom attribute value
 */
- (UserAttributesDictionary *) setCustomAttributeWithKey: (NSString*) attr_key andValue: (NSString*)  attr_value;
    

/**
 * Add user's phone
 *
 * @param phone User's phone id
 */
- (UserAttributesDictionary *) setPhone: (NSString *) phone;
  
/**
 * Add user's name
 *
 * @param name User's name
 */
- (UserAttributesDictionary *) setName: (NSString *) name;
   
/**
 * Add user's surname
 *
 * @param surname User's surname
 */
- (UserAttributesDictionary *) setSurname: (NSString *) surname;



@end
