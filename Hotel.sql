ALTER SESSION SET NLS_DATE_FORMAT = "DD-MM-YYYY"
CREATE TABLE guests (
	guest_id NUMBER CONSTRAINT guests_pk PRIMARY KEY,
	guest_name VARCHAR2(12) NOT NULL,
	surname VARCHAR2(32) NOT NULL,
	guest_type_id NUMBER NOT NULL,
	arrived_date DATE
);

CREATE TABLE guests_types (
	guest_type_id NUMBER CONSTRAINT guests_types_pk PRIMARY KEY,
	guest_type VARCHAR2(30)
);

CREATE TABLE rooms (
	room_id NUMBER CONSTRAINT rooms_pk PRIMARY KEY,
	room_type_id NUMBER NOT NULL,
	room_number NUMBER NOT NULL,
	room_level NUMBER NOT NULL,
	capacity NUMBER NOT NULL
);

CREATE TABLE rooms_types (
	room_type_id NUMBER CONSTRAINT rooms_types_pk PRIMARY KEY,
	room_type VARCHAR2(30),
	cost_per_day NUMBER
);

CREATE TABLE orders (
	order_id NUMBER CONSTRAINT orders_pk PRIMARY KEY,
	room_type_id NUMBER NOT NULL,
	guest_id NUMBER NOT NULL,
	start_date DATE NOT NULL, 
	end_date DATE NOT NULL
);

CREATE TABLE rooms_allocated (
	room_allocated_id NUMBER CONSTRAINT rooms_allocated_pk PRIMARY KEY,
	room_id NUMBER NOT NULL,
	guest_id NUMBER NOT NULL,
	start_date DATE NOT NULL,
	end_date DATE NOT NULL
);

CREATE TABLE hotel_summary (
	guest_id NUMBER,
	guest_name VARCHAR2(12),
	surname VARCHAR2(32),
	how_many NUMBER,
	how_long NUMBER
);

ALTER TABLE guests
	ADD CONSTRAINT guest_type_fk
	FOREIGN KEY (guest_type_id)
	REFERENCES guests_types(guest_type_id);

ALTER TABLE rooms
	ADD CONSTRAINT room_type_fk
	FOREIGN KEY (room_type_id)
	REFERENCES rooms_types(room_type_id);
  
ALTER TABLE orders
	ADD CONSTRAINT room_type_fk_2
	FOREIGN KEY (room_type_id)
	REFERENCES rooms_types(room_type_id);
ALTER TABLE orders
	ADD CONSTRAINT guests_fk_2
	FOREIGN KEY (guest_id)
	REFERENCES guests(guest_id);
	
ALTER TABLE rooms_allocated
	ADD CONSTRAINT room_fk
	FOREIGN KEY (room_id)
	REFERENCES rooms(room_id);
ALTER TABLE rooms_allocated
	ADD CONSTRAINT guest_fk_3
	FOREIGN KEY (guest_id)
	REFERENCES guests(guest_id);

CREATE SEQUENCE guests_sequence
	START WITH 1
	INCREMENT BY 1
	NOCACHE NOCYCLE;

CREATE SEQUENCE orders_sequence
	START WITH 1
	INCREMENT BY 1
	NOCACHE NOCYCLE;

CREATE SEQUENCE rooms_allocated_sequence
	START WITH 1
	INCREMENT BY 1
	NOCACHE NOCYCLE;

INSERT INTO guests_types(guest_type_id,guest_type)
VALUES (1, 'Zwykły');
INSERT INTO guests_types(guest_type_id,guest_type)
VALUES (2, 'Podwyższony');
INSERT INTO guests_types(guest_type_id,guest_type)
VALUES (3, 'VIP');

INSERT INTO guests(guest_id, guest_name, surname, guest_type_id, arrived_date)
VALUES (guests_sequence.NEXTVAL, 'Janusz', 'Kowalski', 1, NULL);
INSERT INTO guests(guest_id, guest_name, surname, guest_type_id, arrived_date)
VALUES (guests_sequence.NEXTVAL, 'Marianna', 'Nowak', 2, NULL);
INSERT INTO guests(guest_id, guest_name, surname, guest_type_id, arrived_date)
VALUES (guests_sequence.NEXTVAL, 'Grzegorz', 'Hyży', 1, NULL);
INSERT INTO guests(guest_id, guest_name, surname, guest_type_id, arrived_date)
VALUES (guests_sequence.NEXTVAL, 'Andrzej', 'Kozłowski', 3, '30-05-2022');
INSERT INTO guests(guest_id, guest_name, surname, guest_type_id, arrived_date)
VALUES (guests_sequence.NEXTVAL, 'Jaros?aw', 'Morawiecki', 3, SYSDATE);
INSERT INTO guests(guest_id, guest_name, surname, guest_type_id, arrived_date)
VALUES (guests_sequence.NEXTVAL, 'Joanna', 'Wiadro', 1, '25-06-2022');
INSERT INTO guests(guest_id, guest_name, surname, guest_type_id, arrived_date)
VALUES (guests_sequence.NEXTVAL, 'Natalia', 'Konstantynopolitanczykowianeczka', 1, NULL);
INSERT INTO guests(guest_id, guest_name, surname, guest_type_id, arrived_date)
VALUES (guests_sequence.NEXTVAL, 'Sosna', 'Modrzew', 2, NULL);
INSERT INTO guests(guest_id, guest_name, surname, guest_type_id, arrived_date)
VALUES (guests_sequence.NEXTVAL, 'Donald', 'Niemi?y', 1, NULL);
INSERT INTO guests(guest_id, guest_name, surname, guest_type_id, arrived_date)
VALUES (guests_sequence.NEXTVAL, 'Ezebiasz', 'Zpowyłamynowanyminogami', 1, NULL);
INSERT INTO guests(guest_id, guest_name, surname, guest_type_id, arrived_date)
VALUES (guests_sequence.NEXTVAL, 'Anna', 'Nowak', 1, NULL);

INSERT INTO rooms_types(room_type_id,room_type,cost_per_day)
VALUES (1, 'Byle jaki', 10.0);
INSERT INTO rooms_types(room_type_id,room_type,cost_per_day)
VALUES (2, 'Zwykły', 20.0);
INSERT INTO rooms_types(room_type_id,room_type,cost_per_day)
VALUES (3, 'Lepszy', 30.0);
INSERT INTO rooms_types(room_type_id,room_type,cost_per_day)
VALUES (4, 'Luksusowy', 60.0);
INSERT INTO rooms_types(room_type_id,room_type,cost_per_day)
VALUES (5, 'Królewski', 120.0);

INSERT INTO rooms(room_id, room_type_id, room_number, room_level, capacity)
VALUES(1, 1, -6, -1, 1);
INSERT INTO rooms(room_id, room_type_id, room_number, room_level, capacity)
VALUES(2, 1, -5, -1, 1);
INSERT INTO rooms(room_id, room_type_id, room_number, room_level, capacity)
VALUES(3, 1, -4, -1, 2);
INSERT INTO rooms(room_id, room_type_id, room_number, room_level, capacity)
VALUES(4, 1, -3, -1, 3);
INSERT INTO rooms(room_id, room_type_id, room_number, room_level, capacity)
VALUES(5, 1, -2, -1, 3);
INSERT INTO rooms(room_id, room_type_id, room_number, room_level, capacity)
VALUES(6, 1, -1, -1, 2);

INSERT INTO rooms(room_id, room_type_id, room_number, room_level, capacity)
VALUES(7, 2, 1, 0, 2);
INSERT INTO rooms(room_id, room_type_id, room_number, room_level, capacity)
VALUES(8, 2, 2, 0, 3);
INSERT INTO rooms(room_id, room_type_id, room_number, room_level, capacity)
VALUES(9, 2, 3, 0, 3);
INSERT INTO rooms(room_id, room_type_id, room_number, room_level, capacity)
VALUES(10, 2, 4, 0, 2);
INSERT INTO rooms(room_id, room_type_id, room_number, room_level, capacity)
VALUES(11, 2, 5, 0, 1);
INSERT INTO rooms(room_id, room_type_id, room_number, room_level, capacity)
VALUES(12, 2, 6, 0, 1);

INSERT INTO rooms(room_id, room_type_id, room_number, room_level, capacity)
VALUES(13, 3, 101, 1, 2);
INSERT INTO rooms(room_id, room_type_id, room_number, room_level, capacity)
VALUES(14, 3, 102, 1, 3);
INSERT INTO rooms(room_id, room_type_id, room_number, room_level, capacity)
VALUES(15, 3, 103, 1, 3);
INSERT INTO rooms(room_id, room_type_id, room_number, room_level, capacity)
VALUES(16, 3, 104, 1, 2);
INSERT INTO rooms(room_id, room_type_id, room_number, room_level, capacity)
VALUES(17, 3, 105, 1, 1);
INSERT INTO rooms(room_id, room_type_id, room_number, room_level, capacity)
VALUES(18, 3, 106, 1, 3);

INSERT INTO rooms(room_id, room_type_id, room_number, room_level, capacity)
VALUES(19, 3, 201, 2, 1);
INSERT INTO rooms(room_id, room_type_id, room_number, room_level, capacity)
VALUES(20, 3, 202, 2, 1);
INSERT INTO rooms(room_id, room_type_id, room_number, room_level, capacity)
VALUES(21, 3, 203, 2, 2);
INSERT INTO rooms(room_id, room_type_id, room_number, room_level, capacity)
VALUES(22, 3, 204, 2, 2);
INSERT INTO rooms(room_id, room_type_id, room_number, room_level, capacity)
VALUES(23, 3, 205, 2, 3);
INSERT INTO rooms(room_id, room_type_id, room_number, room_level, capacity)
VALUES(24, 3, 206, 2, 3);

INSERT INTO rooms(room_id, room_type_id, room_number, room_level, capacity)
VALUES(25, 4, 301, 3, 1);
INSERT INTO rooms(room_id, room_type_id, room_number, room_level, capacity)
VALUES(26, 4, 302, 3, 2);
INSERT INTO rooms(room_id, room_type_id, room_number, room_level, capacity)
VALUES(27, 4, 303, 3, 2);
INSERT INTO rooms(room_id, room_type_id, room_number, room_level, capacity)
VALUES(28, 4, 304, 3, 3);
INSERT INTO rooms(room_id, room_type_id, room_number, room_level, capacity)
VALUES(29, 4, 305, 3, 3);
INSERT INTO rooms(room_id, room_type_id, room_number, room_level, capacity)
VALUES(30, 4, 306, 3, 1);

INSERT INTO rooms(room_id, room_type_id, room_number, room_level, capacity)
VALUES(31, 5, 401, 4, 1);
INSERT INTO rooms(room_id, room_type_id, room_number, room_level, capacity)
VALUES(32, 5, 402, 4, 1);
INSERT INTO rooms(room_id, room_type_id, room_number, room_level, capacity)
VALUES(33, 5, 403, 4, 2);
INSERT INTO rooms(room_id, room_type_id, room_number, room_level, capacity)
VALUES(34, 5, 404, 4, 2);
INSERT INTO rooms(room_id, room_type_id, room_number, room_level, capacity)
VALUES(35, 5, 405, 4, 3);
INSERT INTO rooms(room_id, room_type_id, room_number, room_level, capacity)
VALUES(36, 5, 406, 4, 3);

INSERT INTO orders(order_id, room_type_id, guest_id, start_date, end_date)
VALUES(orders_sequence.NEXTVAL, 2, 1, '27-05-2022', '27-06-2022');
INSERT INTO orders(order_id, room_type_id, guest_id, start_date, end_date)
VALUES(orders_sequence.NEXTVAL, 2, 2, '27-05-2022', '27-06-2022');

INSERT INTO rooms_allocated(room_allocated_id, room_id, guest_id, start_date, end_date)
VALUES (rooms_allocated_sequence.NEXTVAL, 6, 3, SYSDATE, '10-06-2022');
INSERT INTO rooms_allocated(room_allocated_id, room_id, guest_id, start_date, end_date)
VALUES (rooms_allocated_sequence.NEXTVAL, 7, 6, '27-03-2022', '01-04-2022');
INSERT INTO rooms_allocated(room_allocated_id, room_id, guest_id, start_date, end_date)
VALUES (rooms_allocated_sequence.NEXTVAL, 8, 6, '15-04-2022', '19-04-2022');
INSERT INTO rooms_allocated(room_allocated_id, room_id, guest_id, start_date, end_date)
VALUES (rooms_allocated_sequence.NEXTVAL, 9, 6, '09-05-2022', '10-06-2022');
INSERT INTO rooms_allocated(room_allocated_id, room_id, guest_id, start_date, end_date)
VALUES (rooms_allocated_sequence.NEXTVAL, 10, 6, '24-06-2022', '29-06-2022');
INSERT INTO rooms_allocated(room_allocated_id, room_id, guest_id, start_date, end_date)
VALUES (rooms_allocated_sequence.NEXTVAL, 5, 4, '30-05-2022', '03-06-2022');
INSERT INTO rooms_allocated(room_allocated_id, room_id, guest_id, start_date, end_date)
VALUES (rooms_allocated_sequence.NEXTVAL, 1, 1, SYSDATE, '03-06-2022');
/
CREATE OR REPLACE PROCEDURE guest_arrived_with_reservation IS
  CURSOR c1 IS SELECT * FROM rooms_allocated ra INNER JOIN guests g USING (guest_id) WHERE TRUNC(g.arrived_date) = TRUNC(ra.start_date);
BEGIN
  dbms_output.put_line('Goście, którzy przybyli zgodnie z rezerwacją to:');
	FOR i IN c1 LOOP
    dbms_output.put_line(i.guest_name||' '||i.surname);
  END LOOP;
END;
/
CREATE OR REPLACE PROCEDURE deallocate_room(deallocate_room_id NUMBER) IS
	v_room_allocated_id NUMBER;
BEGIN
	SELECT room_allocated_id INTO v_room_allocated_id FROM rooms_allocated WHERE room_id=deallocate_room_id ORDER BY room_allocated_id DESC FETCH NEXT 1 ROWS ONLY;
	UPDATE rooms_allocated SET end_date = SYSDATE WHERE room_allocated_id=v_room_allocated_id;
	dbms_output.put_line('Pokój o id '||deallocate_room_id||' został zwolniony');
END;
/--2
CREATE OR REPLACE PROCEDURE kick_guest_if_vip_arrive(vip_guest_id NUMBER, wanted_room_type_id NUMBER, wanted_capacity NUMBER, wanted_start_date DATE)
IS
	v_room_id NUMBER;
	v_order_id NUMBER;
	v_kicked_guest_id NUMBER;
	v_kicked_room_allocate_id NUMBER;
	v_kicked_start_date DATE;
	v_kicked_end_date DATE;
	v_allocated_rooms NUMBER;
BEGIN
  SELECT COUNT(*) INTO v_allocated_rooms FROM rooms r INNER JOIN rooms_allocated ra USING (room_id) INNER JOIN rooms_types rt USING (room_type_id) 
		WHERE room_type_id=wanted_room_type_id AND r.capacity=wanted_capacity AND ra.start_date = wanted_start_date;
	IF v_allocated_rooms < 2 THEN
		SELECT room_id INTO v_room_id FROM rooms r INNER JOIN rooms_types rt USING (room_type_id) 
			WHERE room_type_id=wanted_room_type_id AND r.capacity=wanted_capacity FETCH NEXT 1 ROWS ONLY;
		INSERT INTO rooms_allocated VALUES (rooms_allocated_sequence.NEXTVAL, v_room_id, vip_guest_id, wanted_start_date, wanted_start_date+1);
		dbms_output.put_line('Zarezerwowano pokój dla VIP-a bez wykopania gościa.');
	ELSE
		SELECT room_id INTO v_room_id FROM rooms r INNER JOIN rooms_types rt USING (room_type_id)
			WHERE room_type_id=wanted_room_type_id AND r.capacity=wanted_capacity FETCH NEXT 1 ROWS ONLY;
		SELECT guest_id INTO v_kicked_guest_id FROM guests g INNER JOIN rooms_allocated ra USING (guest_id) 
			WHERE room_id=v_room_id ORDER BY start_date DESC FETCH NEXT 1 ROWS ONLY;
		SELECT start_date, end_date, room_allocated_id INTO v_kicked_start_date, v_kicked_end_date, v_kicked_room_allocate_id FROM rooms_allocated 
			WHERE room_id=v_room_id ORDER BY room_allocated_id DESC FETCH NEXT 1 ROWS ONLY;
		INSERT INTO orders VALUES (orders_sequence.NEXTVAL, wanted_room_type_id, v_kicked_guest_id, v_kicked_start_date, v_kicked_end_date);
		UPDATE rooms_allocated SET guest_id=vip_guest_id, start_date=wanted_start_date, end_date=wanted_start_date+1 WHERE room_allocated_id=v_kicked_room_allocate_id;
		dbms_output.put_line('Zarezerwowano pokój dla VIP-a ale trzeba było wykopać gościa. Pozwał nas do sądu.');
	END IF;
END;
/--3
CREATE OR REPLACE PACKAGE hotel_package
IS
	PROCEDURE enter_guest(guest_name varchar2, surname varchar2, guest_type_id NUMBER);
	PROCEDURE show_unallocated_rooms(start_date_p DATE, end_date_p DATE) ;
	PROCEDURE assign_room(guest_id NUMBER, wanted_room_type_id VARCHAR2, wanted_capacity NUMBER, wanted_start_date DATE, wanted_end_date DATE);
	PROCEDURE guest_arrived(arrive_guest_id NUMBER);
	PROCEDURE remove_allocation(remove_guest_id NUMBER);
	PROCEDURE make_bill(bill_guest_id NUMBER);
	PROCEDURE who_not_arrive;
END hotel_package;
/
CREATE OR REPLACE PACKAGE BODY hotel_package
IS
	FUNCTION check_date(start_date DATE, end_date DATE)
	RETURN NUMBER
		IS
		BEGIN
		IF start_date > end_date THEN
			dbms_output.put_line('Data końca bya wcześniejsza niż początku. Zamienionono je ze sobą.');
			RETURN 0;
		ELSE
			RETURN 1;
		END IF;
	END check_date;
  
	FUNCTION guest_name_by_id(search_guest_id NUMBER) RETURN VARCHAR2 IS
		v_name VARCHAR2(16);
		v_surname VARCHAR2(32);
		v_name_and_surname VARCHAR2(50);
	BEGIN
		SELECT guest_name, surname INTO v_name, v_surname FROM guests WHERE guest_id=search_guest_id;
		v_name_and_surname := v_name||' '||v_surname;
		RETURN v_name_and_surname;
	END;
  
	FUNCTION room_type_by_id(search_room_type_id NUMBER) RETURN VARCHAR2 IS
		v_room_type VARCHAR2(16);
	BEGIN
		SELECT room_type INTO v_room_type FROM rooms_types WHERE room_type_id=search_room_type_id;
		RETURN v_room_type;
	END;
	
	FUNCTION room_number_by_id(search_room_id NUMBER) RETURN NUMBER IS
		v_room_number VARCHAR2(16);
	BEGIN
		SELECT room_number INTO v_room_number FROM rooms WHERE room_id=search_room_id;
		RETURN v_room_number;
	END;
	
  FUNCTION check_guest_last_2_years(wanted_guest_id NUMBER) RETURN NUMBER
	IS
		v_how_many NUMBER;
		v_name_and_surname VARCHAR2(50); 
	BEGIN
		v_name_and_surname := guest_name_by_id(wanted_guest_id);
		SELECT COUNT(*) INTO v_how_many FROM rooms_allocated WHERE guest_id=wanted_guest_id AND start_date >= SYSDATE - 730;
		dbms_output.put_line(v_name_and_surname||' był/a w ciągu ostatnich 2 lat '||v_how_many||' razy w hotelu');
		RETURN v_how_many;
	END;
	
	PROCEDURE enter_guest(guest_name VARCHAR2, surname VARCHAR2, guest_type_id NUMBER) IS
	BEGIN
		INSERT INTO guests VALUES (guests_sequence.NEXTVAL, guest_name, surname, guest_type_id, NULL);
		dbms_output.put_line('Wprowadzono gościa '||guest_name||' '||surname);
	END enter_guest;
	
	PROCEDURE show_unallocated_rooms(start_date_p DATE, end_date_p DATE) IS
		v_room_type VARCHAR2(20);
    CURSOR c1 IS 
      SELECT * FROM rooms WHERE room_id NOT IN (
      SELECT room_id FROM rooms_allocated ra INNER JOIN rooms r USING (room_id) WHERE start_date>=start_date_p AND end_date<=end_date_p)
      ORDER BY room_number;
	BEGIN
		dbms_output.put_line('Pokoje wolne od '||start_date_p||' do '||end_date_p);
		FOR i IN c1 LOOP
			v_room_type := room_type_by_id(i.room_type_id);
			dbms_output.put_line(i.room_number||' '||v_room_type||' '||i.capacity);
		END LOOP;
	END show_unallocated_rooms;
	
	PROCEDURE assign_room(guest_id NUMBER, wanted_room_type_id VARCHAR2, wanted_capacity NUMBER, wanted_start_date DATE, wanted_end_date DATE)
	IS
		v_room_id NUMBER;
		v_allocated_rooms NUMBER;
		v_wanted_room_type VARCHAR2(20);
		v_temp DATE;
		v_start DATE;
		v_end DATE;
	BEGIN
		IF check_date(wanted_start_date, wanted_end_date) = 0 THEN
		  v_temp := wanted_start_date;
		  v_start := wanted_end_date;
		  v_end := v_temp;
		ELSE
		  v_start := wanted_start_date;
		  v_end := wanted_end_date;
		END IF;
		v_wanted_room_type := room_type_by_id(wanted_room_type_id);
		SELECT COUNT(*) INTO v_allocated_rooms 
			FROM rooms r INNER JOIN rooms_allocated ra USING (room_id) INNER JOIN rooms_types rt USING (room_type_id) 
			WHERE room_type_id=wanted_room_type_id AND r.capacity=wanted_capacity AND ra.start_date >= v_start AND ra.start_date <= v_end;
		IF v_allocated_rooms<2 THEN
			IF v_allocated_rooms=0 THEN
				SELECT room_id INTO v_room_id
					FROM rooms r INNER JOIN rooms_types USING (room_type_id)
					WHERE room_type_id=wanted_room_type_id AND capacity=wanted_capacity FETCH NEXT 1 ROWS ONLY;
			ELSE
				SELECT room_id INTO v_room_id
					FROM rooms r INNER JOIN rooms_types USING (room_type_id)
					WHERE room_type_id=wanted_room_type_id AND capacity=wanted_capacity OFFSET 1 ROWS FETCH NEXT 1 ROWS ONLY;
			END IF;
				INSERT INTO rooms_allocated VALUES (rooms_allocated_sequence.NEXTVAL, v_room_id, guest_id, v_start, v_end);
				dbms_output.put_line('Znaleziono i zarezerwowano pokój typu '||v_wanted_room_type||' z '||wanted_capacity||' łóżkami na okres od '||v_start||' do '||v_end);
		ELSE
			INSERT INTO orders VALUES (orders_sequence.NEXTVAL, wanted_room_type_id, guest_id, v_start, v_end);
			dbms_output.put_line('Nie znaleziono wolnego pokoju typu '||v_wanted_room_type||' z '||wanted_capacity||' łóżkami na okres od '||v_start||' do '||v_end||'. Wpisano do tabeli zamówień.');
		END IF;
	END assign_room; 
	
	PROCEDURE guest_arrived(arrive_guest_id NUMBER) IS
		v_check_assigned NUMBER;
		v_guest_name_and_surname VARCHAR2(50);
	BEGIN
		UPDATE guests SET arrived_date = SYSDATE WHERE guest_id=arrive_guest_id;
		v_guest_name_and_surname := guest_name_by_id(arrive_guest_id);
		dbms_output.put_line('Gośc '||v_guest_name_and_surname||' przybył/a do hotelu.');
		SELECT COUNT(*) INTO v_check_assigned FROM rooms_allocated WHERE guest_id=arrive_guest_id;
		IF v_check_assigned=0 THEN
			dbms_output.put_line('Nie ma jeszcze przypisanego pokoju.');
		END IF;
	END guest_arrived;
	
	PROCEDURE remove_allocation(remove_guest_id NUMBER)
	IS
		v_room_allocation_id NUMBER;
		v_room_id NUMBER;
		v_guest_in_hotel NUMBER;
		v_guest_name_and_surname VARCHAR2(50);
		v_room_number NUMBER;
	BEGIN
		SELECT COUNT(*) INTO v_guest_in_hotel FROM rooms_allocated 
		  WHERE guest_id=remove_guest_id;
		IF v_guest_in_hotel=0 THEN RAISE VALUE_ERROR;
		END IF;
		SELECT room_allocated_id, room_id INTO v_room_allocation_id, v_room_id FROM rooms_allocated 
			WHERE guest_id=remove_guest_id ORDER BY room_allocated_id DESC FETCH NEXT 1 ROWS ONLY;
		UPDATE rooms_allocated SET end_date=SYSDATE WHERE room_allocated_id = v_room_allocation_id;
		UPDATE guests SET arrived_date = NULL WHERE guest_id=remove_guest_id;
		v_guest_name_and_surname := guest_name_by_id(remove_guest_id);
		v_room_number := room_number_by_id(v_room_id);
		dbms_output.put_line('Gośc '||v_guest_name_and_surname||' wybył/a z hotelu.');
		dbms_output.put_line('Pokój numer '||v_room_number||' został zwolniony.');
	EXCEPTION
		WHEN VALUE_ERROR THEN dbms_output.put_line('Gość aktualnie nie przebywa w hotelu');
	END remove_allocation;
	
	PROCEDURE make_bill(bill_guest_id NUMBER) IS
		v_visits NUMBER;
		v_days NUMBER;
		v_room_id NUMBER;
		v_cost_per_day NUMBER;
		v_guest_name_and_surname VARCHAR2(50);
	BEGIN
		v_visits := check_guest_last_2_years(bill_guest_id);
		IF v_visits=0 THEN
			dbms_output.put_line('Nie można wystawić rachunku');
		ELSE
			v_guest_name_and_surname := guest_name_by_id(bill_guest_id);
			SELECT TRUNC(end_date-start_date)+1, room_id INTO v_days, v_room_id FROM rooms_allocated WHERE guest_id=bill_guest_id ORDER BY start_date DESC FETCH NEXT 1 ROWS ONLY;
			SELECT rt.cost_per_day INTO v_cost_per_day FROM rooms_types rt INNER JOIN rooms r USING (room_type_id) WHERE room_id=v_room_id;
			IF v_visits<3 THEN
				dbms_output.put_line('Płaci '||v_days||'x'||v_cost_per_day||'='||v_days*v_cost_per_day||' zł');
			ELSE
				dbms_output.put_line('Gość ze zniżką. Płaci 80%'||v_days||'x'||v_cost_per_day||'='||0.8*v_days*v_cost_per_day||' zł');
			END IF;
		END IF;
	END make_bill;
	
	PROCEDURE who_not_arrive IS
		CURSOR c IS SELECT * FROM rooms_allocated ra INNER JOIN guests g USING (guest_id) WHERE TRUNC(start_date) = TRUNC(SYSDATE) AND arrived_date IS NULL;
	BEGIN
		dbms_output.put_line('Dzisiaj jest '||SYSDATE);
		dbms_output.put_line('Nie przybyli jeszcze: ');
		FOR i IN c LOOP
			dbms_output.put_line(i.guest_name||' '||i.surname);
		END LOOP;
	END who_not_arrive;
	
END hotel_package;
/
--4
CREATE OR REPLACE PROCEDURE make_summary IS
	CURSOR c1 IS SELECT guest_id, guest_name, surname FROM guests;
	CURSOR c2(search_guest_id NUMBER) IS
	SELECT COUNT(*) AS guest_how_many, SUM(TRUNC(end_date)-TRUNC(start_date)) AS days_sum 
		FROM rooms_allocated WHERE guest_id=search_guest_id;
	v_sum c2%ROWTYPE;
BEGIN
  EXECUTE IMMEDIATE 'TRUNCATE TABLE hotel_summary DROP STORAGE';
	FOR i IN c1 LOOP
    OPEN c2(i.guest_id);
    FETCH c2 INTO v_sum;
    CLOSE c2;
		INSERT INTO hotel_summary VALUES(i.guest_id, i.guest_name, i.surname, v_sum.guest_how_many, v_sum.days_sum);
	END LOOP;
	DELETE FROM orders WHERE start_date < SYSDATE - 1825;
	DELETE FROM rooms_allocated WHERE start_date < SYSDATE - 1825;
  dbms_output.put_line('Stworzono raport');
END;
/
--5
CREATE OR REPLACE TRIGGER check_date_on_orders
BEFORE INSERT OR UPDATE OR DELETE ON orders
FOR EACH ROW
DECLARE
	v_date DATE;
BEGIN
	IF :NEW.start_date > :NEW.end_date THEN
		v_date := :NEW.start_date;
		:NEW.start_date := :NEW.end_date;
		:NEW.end_date := v_date;
		dbms_output.put_line('Data końca bya wcześniejsza niż początku. Zamienionono je ze sobą.');
	END IF;
END;
/
CREATE OR REPLACE TRIGGER check_date_rooms_allocations
BEFORE INSERT OR UPDATE OR DELETE ON rooms_allocated
FOR EACH ROW
DECLARE
  v_date DATE;
BEGIN
	IF :NEW.start_date > :NEW.end_date THEN
		v_date := :NEW.start_date;
		:NEW.start_date := :NEW.end_date;
		:NEW.end_date := v_date;
		dbms_output.put_line('Data końca bya wcześniejsza niż początku. Zamienionono je ze sobą.');
	END IF;
END;
/
CREATE OR REPLACE TRIGGER update_summary
BEFORE INSERT OR UPDATE OR DELETE ON rooms_allocated
FOR EACH ROW
FOLLOWS check_date_rooms_allocations
DECLARE
	v_is_new_guest NUMBER;
	v_guest_id NUMBER;
	v_guest_name VARCHAR2(12);
	v_guest_surname VARCHAR2(32);
	v_how_many NUMBER;
	v_how_long NUMBER;
BEGIN
	SELECT COUNT(*) INTO v_is_new_guest FROM hotel_summary WHERE guest_id=:NEW.guest_id;
	IF v_is_new_guest=0 THEN
		SELECT guest_name, surname INTO v_guest_name, v_guest_surname FROM guests WHERE guest_id=:NEW.guest_id;
		INSERT INTO hotel_summary VALUES(:NEW.guest_id, v_guest_name, v_guest_surname, 1, TRUNC(:NEW.end_date) - TRUNC(:NEW.start_date));
	ELSE
		SELECT guest_id, how_many, how_long INTO v_guest_id, v_how_many, v_how_long FROM hotel_summary WHERE guest_id=:NEW.guest_id FETCH NEXT 1 ROWS ONLY;
		UPDATE hotel_summary SET how_many=how_many+1, how_long= (TRUNC(:NEW.end_date) - TRUNC(:NEW.start_date)) WHERE guest_id=v_guest_id;
	END IF;
END;