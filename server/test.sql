SET SERVEROUTPUT ON
SET VERIFY OFF



CREATE OR REPLACE PROCEDURE sampleProcedure
IS
    a pet.animals%type;
	b pet.SIZE_OF_ANIMAL%type;
	c pet.body_color%type;
	d pet.PET_ANIMAL%type;
	
	
    x1 float;
	y1 float;
	z1 float;
	x2 float;
	y2 float;
	z2 float;
	x3 float;
	y3 float;
	z3 float;
	
	pred_y float ;
	pred_n float;
	
	TP number:=0;
	FP  number :=0;
	
	FN number:=0;
	TN  number :=0;
	
	precision_ float;
	accuracy float;
	recall float;
	fscore float;
	
	
	

BEGIN
	
		  
	FOR R IN (SELECT ANIMALS,SIZE_OF_ANIMAL,BODY_COLOR,PET_ANIMAL FROM TEST@SITE1)
	LOOP
	    a:=upper(R.Animals);
		d:=R.pet_Animal;
		
		
		b:=upper(R.SIZE_OF_ANIMAL);
		c:=upper(R.BODY_COLOR);
		select prob_yes,prob_no into x1,x2 from Animaltable@site1 where Aname=a;
		select prob_yes,prob_no into y1,y2 from sizetable@site1 where asize=b;
		select prob_yes,prob_no into z1,z2 from colortable where acolor=c;
		pred_y:=x1*y1*z1;
		pred_n:=x2*y2*z2;
		dbms_output.put_line
		('yes :' || round(pred_y,2) || ' ' || 'no : '|| round(pred_n,2));
	
		
		if pred_y>=pred_n and d='Yes' THEN
		   TP:=TP+1;
		dbms_output.put_line('Actual : ' || d || ' ' || ' Predicted :Yes' );
	
        ELSif pred_y>=pred_n and d='No' THEN
		   dbms_output.put_line('Actual : ' || d || ' ' || ' Predicted :Yes' );
		   FP:=FP+1;
		ELSif pred_y<pred_n and d='Yes' THEN
		  dbms_output.put_line('Actual : ' || d || ' ' || ' Predicted :NO' );
		    FN:=FN+1;
	    ELSIF pred_y<pred_n and d='No' THEN
		    dbms_output.put_line('Actual : ' || d || ' ' || ' Predicted :NO' );
             TN:=Tn+1;
        end if;	
        dbms_output.put_line(chr(10));
	END LOOP;
	
	
	dbms_output.put_line(chr(10));
	dbms_output.put_line('True Positive :' || TP);
	dbms_output.put_line('False Positive :' || FP);
	dbms_output.put_line('True Negative :' || TN);
	dbms_output.put_line('False Negative :' || FN);
	
	precision_:=TP/(TP+FP);
	accuracy:= (TP+TN)/(TP+FN+TN+FP);
	recall:= TP/(TP+FN);
	fscore:= (2*PRECISION_*RECALL)/(PRECISION_+RECALL);
    	dbms_output.put_line(chr(10));
	dbms_output.put_line('Precision :' || round(precision_,2));
	dbms_output.put_line('Accuracy :' || round(accuracy,2));
	dbms_output.put_line('recall :' || round(recall,2));
	dbms_output.put_line('Fscore :' || round(fscore,2));
	
	
	
	
END sampleProcedure;
/



BEGIN
     	sampleProcedure;
end;
/

delete from animaltable@site1;
delete from sizetable@site1;
delete from colortable;


--@"F:\sem 4.1\CSE 4126 DDS lab\project\test.sql";

