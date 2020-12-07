USE IPL;
---Team Deatils table creted
CREATE TABLE Team_Dim(
TeamId		numeric(10)	NOT NULL,
TeamName		varchar(32)	NOT NULL,
Team_Previous_Name varchar(32),
CONSTRAINT Team_TeamId_PK PRIMARY KEY (TeamId));

select * from Team_Dim

---Player Deatils table creted
CREATE TABLE Player_dim(
Player_Id		numeric(10)	NOT NULL,
Name			varchar(32)	NOT NULL,
Batting_Hand		varchar(32)	NOT NULL,
Bowling_skills		varchar(32)	NOT NULL,
Birth_country		varchar(32)	NOT NULL,
Playing_country	varchar(32)	NOT NULL,
Date_of_birth		DATETIME,
CONSTRAINT Player_Player_Id_PK PRIMARY KEY (Player_Id));

select * from Player_dim;

---Match Date table creted
CREATE TABLE Date_dim(
Date_key		numeric(10)	NOT NULL,
Date			varchar(32)	NOT NULL,
Calendar_Year		varchar(32)	NOT NULL,
Calendar_Month	varchar(32)	NOT NULL,
Calendar_Day		varchar(32)	NOT NULL,
Full_date_desp	varchar(32)	NOT NULL,
CONSTRAINT Date_Date_key_PK PRIMARY KEY (Date_key));

select * from Date_dim

--- Match Details table creted
CREATE TABLE Match_Details_Dim(
MatchId		numeric(10)	NOT NULL,
Team1			varchar(32)	NOT NULL,
Team2			varchar(32)	NOT NULL,
Result			varchar(32)	NOT NULL,
CONSTRAINT Match_MatchId_PK PRIMARY KEY (MatchId));

select * from Match_Details_Dim


---Ball dimension table created

CREATE TABLE Ball_dimension(
ID				numeric(10)	NOT NULL,
MatchId	        numeric(10)	NOT NULL,
OverId		    numeric(10)	NOT NULL,
BallId		    numeric(10)	NOT NULL,
Team_Batting	numeric(10)	NOT NULL,
Team_Bowling    numeric(10)	NOT NULL,
Inning_no	    numeric(10)	NOT NULL,
Run_scored	    numeric(10)	NOT NULL,
Extra_runs      numeric(10)	NOT NULL,
Wides           numeric(10)	NOT NULL,
Legbyes         numeric(10)	NOT NULL,
Byes            numeric(10)	NOT NULL,
Noballs         numeric(10)	NOT NULL,
Penalty         numeric(10)	NOT NULL,
Out_Type 	    numeric(10)	NOT NULL,
Match_Date      varchar(32),
CONSTRAINT Ball_Id_PK PRIMARY KEY (ID),
CONSTRAINT Ball_MatchId_FK FOREIGN KEY (MatchId) REFERENCES Match_Details_Dim (MatchId));

select * from Ball_dimension;


--Player match table created 

CREATE TABLE Player_Match_dimension(
Player_Match_key		numeric(10)	NOT NULL,
MatchId	numeric(10)	NOT NULL,
Player_Id	numeric(10)	NOT NULL,
TeamId	numeric(10)	NOT NULL,
CONSTRAINT Player_Match_Player_Match_key_PK PRIMARY KEY (Player_Match_key),
CONSTRAINT Player_Match_MatchId_FK FOREIGN KEY (MatchId) REFERENCES Match_Details_Dim (MatchId),
CONSTRAINT Player_Match_TeamId_FK FOREIGN KEY (TeamId) REFERENCES Team_Dim (TeamId),
CONSTRAINT Player_Match_PlayerId_FK FOREIGN KEY (Player_Id) REFERENCES Player_Dim (Player_Id));

select * from Player_Match_dimension;

-- Fact table
CREATE TABLE Match_Fact(
ID              numeric(10),
Ball_ID			numeric(10),
Over_id			numeric(10),
Match_Id		numeric(10),
Date_ID			numeric(10),
Run_scored	    numeric(10),
Extra_runs      numeric(10),
Wides           numeric(10),
Legbyes         numeric(10),
Byes            numeric(10),
Noballs         numeric(10),
Penalty         numeric(10),
Out_Type 	    numeric(10),
CONSTRAINT Match_Fact_PK PRIMARY KEY (ID),
CONSTRAINT Match_Fact_BallId_FK FOREIGN KEY (Ball_ID) REFERENCES Ball_dimension(ID),
CONSTRAINT Match_Fact_MatchId_FK FOREIGN KEY (Match_Id) REFERENCES Match_Details_Dim(MatchId),
CONSTRAINT Match_Fact_Date_key_FK FOREIGN KEY (Date_ID) REFERENCES Date_dim(Date_key))


select * from Match_Fact

	








