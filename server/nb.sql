SET SERVEROUTPUT ON
SET VERIFY OFF



CREATE OR REPLACE TRIGGER triggar 
AFTER INSERT 
ON ColorTable
DECLARE
	
BEGIN
	DBMS_OUTPUT.PUT_LINE('DATA INSERTED SUCCESSFULLY');
END;
/
















CREATE OR REPLACE PACKAGE mypack AS

	
	
	PROCEDURE precomp;
	
	FUNCTION preanimal(total_y IN int,total_n IN int)
	RETURN NUMBER;
	
	FUNCTION presize(total_y IN int,total_n IN int)
	RETURN NUMBER;
	
	FUNCTION precolor(total_y IN int,total_n IN int)
	RETURN NUMBER;
	
	
	PROCEDURE prediction
	(a in pet.animals%TYPE,b IN pet.Size_OF_ANIMAL%TYPE,c IN pet.BODY_COLOR%TYPE);
	
	
	
	
END mypack;

/

CREATE OR REPLACE PACKAGE BODY mypack AS
   
PROCEDURE precomp
IS

    
    Y number;
	Z number;
	L number;
	total_yes INTEGER :=0;
	total_NO INTEGER :=0;
	pa pet.pet_animal%type;
	
    BEGIN
	
	   For I in (select Pet_Animal from pet) LOOP
	       	pa:=I.Pet_Animal;
            if pa='Yes' then
               total_yes:=total_YES+1;
			ELSE
               total_NO:=total_NO+1;   			 
            end if;			
	   end Loop;
       DBMS_OUTPUT.PUT_LINE( 'Total Yes ' || total_YES );
	   DBMS_OUTPUT.PUT_LINE( 'Total NO ' || total_NO );
	
	    y:=mypack.preanimal(total_yes,total_NO);
	    Z:=mypack.presize(total_yes,total_NO);
		L:=mypack.precolor(total_yes,total_NO);
		
    END precomp;
	 
	 
	 
	 
	FUNCTION preanimal(total_y IN int,total_n IN int)
	RETURN NUMBER
	
	is
	total_dyes INTEGER :=0;
	total_dNO INTEGER :=0;
	total_ryes INTEGER :=0;
	total_rNO INTEGER :=0;
	total_cyes INTEGER :=0;
	total_cNO INTEGER :=0;
	aname varchar2(11);
	
    BEGIN
	
	  for I in (select Animals from pet1) 
	   LOOP
	        
			aname:=I.Animals;
			if aname='Dog' then
			     total_dyes:=total_dyes+1;
	        ElsIf aname='Rat'  then
			      total_ryes:=total_ryes+1;
		    ELSIf 
			
			     aname='Cow'  then
                  total_cyes:=total_cyes+1;    			
                  			
			end if;  
			  
			  
	   end loop;
	   
	   
	   
	    for I in (select Animals from pet2@site1) 
	   LOOP
	        
			aname:=I.Animals;
			if aname='Dog' then
			     total_dno:=total_dno+1;
			ElsIf aname='Rat' then
			      total_rno:=total_rno+1;
		    ELSE
                  total_cno:=total_cno+1;    			
           	 
				 
			end if;  
			  
			  
	   end loop;
	        
        insert into AnimalTable@site1 values(1,'DOG',total_dyes,
		total_dno,total_dyes/(total_dYES+total_dNO),total_dno/(total_dYES+total_dNO));

	    insert into AnimalTable@site1 values(2,'RAT',total_ryes,
		total_rno,total_ryes/(total_rYES+total_rNO),total_rno/(total_rYES+total_rNO));
  
	    insert into AnimalTable@site1 values(3,'COW',total_cyes,
		total_cno,total_cyes/(total_cYES+total_cNO),total_cno/(total_cYES+total_cNO));
  
	       
	  
      return 5;

    end preanimal;	
	
	
	
	
	
	
	
	FUNCTION presize(total_y IN int,total_n IN int)
	RETURN NUMBER
	
	is
	total_dyes INTEGER :=0;
	total_dNO INTEGER :=0;
	total_ryes INTEGER :=0;
	total_rNO INTEGER :=0;
	total_cyes INTEGER :=0;
	total_cNO INTEGER :=0;
	aname varchar2(14);
	
    BEGIN
	
	  for I in (select Size_OF_ANIMAL from pet1) 
	   LOOP
	        
			aname:=I.Size_OF_ANIMAL;
			if aname='Big' then
			     total_dyes:=total_dyes+1;
	        ElsIf aname='Medium'  then
			      total_ryes:=total_ryes+1;
		    ELSIf 
			
			     aname='Small'  then
                  total_cyes:=total_cyes+1;    			
                  			
			end if;  
			  
			  
	   end loop;
	   
	   
	   
	    for I in (select Size_OF_ANIMAL from pet2@site1) 
	   LOOP
	        
			aname:=I.Size_OF_ANIMAL;
			if aname='Big' then
			     total_dno:=total_dno+1;
			ElsIf aname='Medium' then
			      total_rno:=total_rno+1;
		    ELSE
                  total_cno:=total_cno+1;    			
           	 
				 
			end if;  
			  
			  
	   end loop;
	        

	   insert into SizeTable@site1 values(1,'BIG',total_dyes,
		total_dno,total_dyes/(total_dYES+total_dNO),total_dno/(total_dYES+total_dNO));

	    insert into SizeTable@site1 values(2,'MEDIUM',total_ryes,
		total_rno,total_ryes/(total_rYES+total_rNO),total_rno/(total_rYES+total_rNO));
  
	    insert into SizeTable@site1 values(3,'SMALL',total_cyes,
		total_cno,total_cyes/(total_cYES+total_cNO),total_cno/(total_cYES+total_cNO));
  
	    
	  
      return 5;

    end presize;	
	
	
	
	
	FUNCTION precolor(total_y IN int,total_n IN int)
	RETURN NUMBER
	
	is
	total_dyes INTEGER :=0;
	total_dNO INTEGER :=0;
	total_ryes INTEGER :=0;
	total_rNO INTEGER :=0;
	total_cyes INTEGER :=0;
	total_cNO INTEGER :=0;
	aname varchar2(14);
	
    BEGIN
	
	  for I in (select BODY_COLOR from pet1) 
	   LOOP
	        
			aname:=I.BODY_COLOR;
			if aname='Black' then
			     total_dyes:=total_dyes+1;
	        ElsIf aname='White'  then
			      total_ryes:=total_ryes+1;
		    ELSIf 
			
			     aname='Brown'  then
                  total_cyes:=total_cyes+1;    			
                  			
			end if;  
			  
			  
	   end loop;
	   
	   
	   
	    for I in (select BODY_COLOR from pet2@site1) 
	   LOOP
	        
			aname:=I.BODY_COLOR;
			if aname='Black' then
			     total_dno:=total_dno+1;
			ElsIf aname='White' then
			      total_rno:=total_rno+1;
		    ELSE
                  total_cno:=total_cno+1;    			
           	 
				 
			end if;  
			  
			  
	   end loop;
	        
         insert into ColorTable values(1,'BLACK',total_dyes,
		total_dno,total_dyes/(total_dYES+total_dNO),total_dno/(total_dYES+total_dNO));

	    insert into ColorTable values(2,'WHITE',total_ryes,
		total_rno,total_ryes/(total_rYES+total_rNO),total_rno/(total_rYES+total_rNO));
  
	    insert into ColorTable values(3,'BROWN',total_cyes,
		total_cno,total_cyes/(total_cYES+total_cNO),total_cno/(total_cYES+total_cNO));
  
	    
	   
	  
      return 5;

    end precolor;	
	
	
	
		PROCEDURE prediction
	(a in pet.animals%TYPE,b IN pet.Size_OF_ANIMAL%TYPE,c IN pet.BODY_COLOR%TYPE)
	
	IS
	
	x1 PET.ANIMALS%TYPE;
	Y1 float;
	Z1 float;
	x2 PET.sIZE_OF_aNIMAL%TYPE;
	Y2 float;
	Z2 float;
	x3 PET.BODY_COLOR%TYPE;
	Y3 float;
	Z3 float;
	PRED_y FLOAT;
	PRED_N FLOAT;
	
	flag1 NUMBER:=0;
	flag2 NUMBER:=0;
	flag3 NUMBER:=0;
	
	
	invalidinput EXCEPTION;
	searchException EXCEPTION;
    
    
	BEGIN
	  FOR N IN (SELECT ANAME,PROB_yes,PROB_no FROM ANIMALTABLE@SITE1 )
      LOOP
             x1:=N.ANAME;
			  --dbms_output.put_line(x1);
			 Y1:=N.PROB_yes;
			 Z1:=N.PROB_no;
			 IF X1=a then 
			    FLAG1:=1;
				EXIT;
			 end if ;
      END LOOP;	 
	    --dbms_output.put_line(flag1);

      FOR N IN (SELECT ASIZE,PROB_yes,PROB_no FROM SIZETABLE@SITE1 )
      LOOP
             x2:=N.ASIZE;
			 Y2:=N.PROB_yes;
			 Z2:=N.PROB_no;
			 IF X2=b then 
			    FLAG2:=1;
				EXIT;
			 end if ;
      END LOOP;	 


      FOR N IN (SELECT Acolor,PROB_yes,PROB_no FROM COLORTABLE )
      LOOP
             x3:=N.ACOLOR;
			 Y3:=N.PROB_yes;
			 Z3:=N.PROB_no;
			 IF X3=C then 
			    FLAG3:=1;
				EXIT;
			 end if ;
      END LOOP;	 


      IF FLAG1=0 OR FLAG2=0 OR FLAG3=0 THEN
	       RAISE INVALIDinput;
      ELSE
	      RAISE searchException;
         
      END IF;
	  EXCEPTION
	  WHEN invalidInput THEN
		   DBMS_OUTPUT.PUT_LINE('TEST DATA INVALID');
		  
	
	    WHEN searchException THEN
		   PRED_y :=Y1*Y2*Y3;
        	PRED_N :=Z1*Z2*Z3;
			DBMS_OUTPUT.PUT_LINE('PREDICTED VALUE YES CLASS :' || ROUND(PRED_y,2));
			DBMS_OUTPUT.PUT_LINE('PREDICTED VALUE no CLASS :' || ROUND(PRED_n,2));
			
		   IF PRED_y>= PRED_N THEN
		       	   DBMS_OUTPUT.PUT_LINE('IT IS A PET');
		    ELSE
			           	   DBMS_OUTPUT.PUT_LINE('IT IS not A PET');
            end if;			
	
       
	   
	  
	END prediction;

	
	 
	 
END mypack;
/

Accept X CHAR prompt "Enter test data Animalname: "
Accept Y CHAR prompt "Enter test data Animalsize: "
Accept Z CHAR prompt "Enter test data AnimalColor: "

DECLARE
N pet.Animals%TYPE :='&X';
M pet.Animals%TYPE :='&Y';
L pet.Animals%TYPE :='&Z';
C pet.Animals%TYPE;
f pet.Animals%TYPE;
BEGIN
  mypack.precomp(); 
  mypack.prediction(N,M,L);
END;
/


SELECT * from animaltable@site1;
SELECT * from sizetable@site1;
SELECT * from colortable;

--@"F:\sem 4.1\CSE 4126 DDS lab\project\test.sql"
--delete from animaltable@site1;
--delete from sizetable@site1;
--delete from colortable;
