data = LOAD '/user/training/ad_data2.txt' USING PigStorage(',')
            AS (campaign_id:chararray,
                date:chararray, 
                time:chararray,
                display_site:chararray, 
                placement:chararray,
                was_clicked:int, 
                cpc:int,
                keyword:chararray);


unique = DISTINCT data;

reordered = FOREACH unique GENERATE campaign_id, 
               REPLACE(date, '-', '/'),
               time,
               UPPER(TRIM(keyword)),
               display_site,
               placement,
               was_clicked,
               cpc;

STORE reordered INTO '/user/training/ad_data2/';
