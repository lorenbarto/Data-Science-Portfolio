#Step 9
CREATE DATABASE pyspark;
#Step 10
USE pyspark;
CREATE TABLE mortality_data(	
	resident_status	 INT
	,education_eithy_nine INT	
	,education_o_three INT	
	,education_flag  INT	
	,month_of_death	 INT
	,sex CHAR(1)
	,detail_age_type INT	
	,detail_age INT
	,age_substitution_flag INT
	,age_recode_fifty_two INT
	,age_recode_twenty_seven INT
	,age_recode_twelve INT
	,infant_age_recode_twenty_two INT	
	,place_of_death_and_decedents_status INT	
	,marital_status	CHAR(1)
	,day_of_week_of_death INT	
	,current_data_year  YEAR(4)
	,injury_at_work	  CHAR(1)
	,manner_of_death  INT	
	,method_of_disposition	 CHAR(1)
	,autopsy   CHAR(1) 	
	,activity_code	 INT
	,place_of_injury_for_causes  INT
	,icd_code_tenth_revision  VARCHAR(10)
	,three_fifty_eight_cause_recode	 INT
	,one_thirteen_cause_recode  INT	
	,one_thirty_infant_cause_recode	 INT
	,thirty_nine_cause_recode  INT	
	,number_of_entity_axis_conditions INT	
	,entity_condition_one VARCHAR(250)
	,entity_condition_two VARCHAR(250)
	,entity_condition_three	VARCHAR(250)
	,entity_condition_four VARCHAR(250)
	,entity_condition_five VARCHAR(250)	
	,entity_condition_six VARCHAR(250)
	,entity_condition_seven VARCHAR(250)	
	,entity_condition_eight	VARCHAR(250)
	,entity_condition_nine	VARCHAR(250)
	,entity_condition_ten	VARCHAR(250)
	,entity_condition_eleven VARCHAR(250)	
	,entity_condition_twelve VARCHAR(250)	
	,entity_condition_thirteen VARCHAR(250)	
	,entity_condition_fourteen VARCHAR(250)	
	,entity_condition_fifteen VARCHAR(250)	
	,entity_condition_sixteen VARCHAR(250)	
	,entity_condition_seventeen VARCHAR(250)	
	,entity_condition_eighteen VARCHAR(250)	
	,entity_condition_nineteen VARCHAR(250)	
	,entity_condition_twenty VARCHAR(250)	
	,number_of_record_axis_conditions INT
	,record_condition_one VARCHAR(20)
	,record_condition_two VARCHAR(250)	
	,record_condition_three VARCHAR(250)	
	,record_condition_four	VARCHAR(250)
	,record_condition_five	VARCHAR(250)
	,record_condition_six	VARCHAR(250)
	,record_condition_seven	VARCHAR(250)
	,record_condition_eight	VARCHAR(250)
	,record_condition_nine	VARCHAR(250)
	,record_condition_ten	VARCHAR(250)
	,record_condition_eleven VARCHAR(250)	
	,record_condition_twelve VARCHAR(250)	
	,record_condition_thirteen VARCHAR(250)	
	,record_condition_fourteen VARCHAR(250)	
	,record_condition_fifteen VARCHAR(250)	
	,record_condition_sixteen VARCHAR(250)	
	,record_condition_seventeen VARCHAR(250)	
	,record_condition_eighteen VARCHAR(250)	
	,record_condition_nineteen VARCHAR(250)	
	,record_condition_twenty VARCHAR(250)	
	,race INT
	,bridged_race_flag INT
	,race_imputation_flag INT	
	,race_recode_three INT
	,race_recode_five INT
	,hispanic_origin INT
	,hispanic_originrace_recode INT
	);
    
    #Step 11
    #--Script to Load the mortality data into the Mortality_Data table. 
    #Alternatively, you can load the data one csv file at a time
    #NOTE_1a: this is the load data query if you want to use the MySQL prompt
    #NOTE_1b: To run the following query, you must be logged into MySQL as using the command: mysql --local-infile -u USERNAME -p
    #Once logged on to Mysql Run these queries
    SET GLOBAL local_infile = 1;
    LOAD DATA LOCAL INFILE '/var/lib/software/mortality/*.csv'    #this is just the full file path
			INTO TABLE  mortality_data 
            FIELDS TERMINATED BY ','       
            LINES TERMINATED BY '\n';
            
	#NOTE_2: This is the load data query if you want to use the Linux prompt
    # $ cat ./FILENAME.csv | awk '{print "insert into TABLE_NAME set FIRST_COLUMN_NAME=\""$1"\";"}' | mysql --local-infile -u USERNAME -p DATABASENAME
    
   #Once uploaded:
SELECT COUNT(*) FROM Mortality_Data;
SELECT * FROM mortality_data;

#Dumped the data table as a CSV file using the Command
SELECT INTO OUTFILE 'all_mortality_data'
		FIELDS TERMINATED BY ','       
    LINES TERMINATED BY '\n'
    FROM mortality_data;

#To copy CSV file from Linux Server to Windows, run the following command from Windows CLI
pscp directory_Id@localhost:<file-path>/all_mortality.csv C:\<desired-file-destination>\

  

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    