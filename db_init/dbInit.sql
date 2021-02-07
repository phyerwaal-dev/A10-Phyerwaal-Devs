CREATE TABLE "users" (
    "phone_no" varchar(255) NOT NULL,
    "email" varchar(255) UNIQUE,
    "password" varchar(255) NOT NULL,
    "username" varchar(255) NOT NULL,
    "password_recovery_token" varchar(255),
    "status" varchar(255) NOT NULL DEFAULT 'active',
    CONSTRAINT "users_pk" PRIMARY KEY ("phone_no")
) WITH (OIDS = FALSE);
CREATE TABLE "bus" (
    "bus_no" varchar(10) NOT NULL UNIQUE,
    "start_loc" bigint NOT NULL,
    "dest_loc" bigint NOT NULL,
    "route" int [] default array []::int [],
    "status" varchar(255) NOT NULL DEFAULT 'active',
    CONSTRAINT "bus_pk" PRIMARY KEY ("bus_no")
) WITH (OIDS = FALSE);
CREATE TABLE "bus_stop" (
    "stop_id" serial NOT NULL,
    "stop_name" varchar(255) NOT NULL,
    "address" varchar(255) NOT NULL UNIQUE,
    "stop_loc" varchar(255) NOT NULL,
    CONSTRAINT "bus_stop_pk" PRIMARY KEY ("stop_id")
) WITH (OIDS = FALSE);
CREATE TABLE "tickets" (
    "ticket_no" serial NOT NULL,
    "email_phone" varchar(255) NOT NULL,
    "start_loc" bigint NOT NULL,
    "dest_loc" bigint NOT NULL,
    "fare" varchar(255) NOT NULL,
    "payment_status" varchar(255) NOT NULL,
    -- pending, successful, failed
    "timestamp" varchar(255) NOT NULL,
    "transaction_time" varchar(255),
    "conductor_id" varchar(255),
    "plate_no" varchar(255),
    "bus_no" varchar(255),
    "verified" boolean default FALSE,
    --true/false
    "date" DATE not null,
    CONSTRAINT "tickets_pk" PRIMARY KEY ("ticket_no")
) WITH (OIDS = FALSE);
CREATE TABLE "conductor" (
    "conductor_id" varchar(255) NOT NULL,
    "password" varchar(255) NOT NULL,
    "plate_no" varchar(255) NOT NULL,
    CONSTRAINT "conductor_pk" PRIMARY KEY ("conductor_id")
) WITH (OIDS = FALSE);
CREATE TABLE "vehicle" (
    "plate_no" varchar(255) NOT NULL,
    "bus_no" varchar(255) NOT NULL,
    "passenger_count" varchar(255),
    "curr_loc" varchar(255),
    "stop_id" bigint NOT NULL,
    "status" varchar(255) NOT NULL DEFAULT 'active',
    CONSTRAINT "vehicle_pk" PRIMARY KEY ("plate_no")
) WITH (OIDS = FALSE);
ALTER TABLE "bus"
ADD CONSTRAINT "bus_fk0" FOREIGN KEY ("start_loc") REFERENCES "bus_stop"("stop_id");
ALTER TABLE "bus"
ADD CONSTRAINT "bus_fk1" FOREIGN KEY ("dest_loc") REFERENCES "bus_stop"("stop_id");
ALTER TABLE "bus"
ADD CONSTRAINT "bus_fk2" FOREIGN KEY ("route") REFERENCES "bus_stop"("stop_id");
ALTER TABLE "tickets"
ADD CONSTRAINT "tickets_fk0" FOREIGN KEY ("email_phone") REFERENCES "users"("phone_no");
ALTER TABLE "tickets"
ADD CONSTRAINT "tickets_fk1" FOREIGN KEY ("start_loc") REFERENCES "bus_stop"("stop_id");
ALTER TABLE "tickets"
ADD CONSTRAINT "tickets_fk2" FOREIGN KEY ("dest_loc") REFERENCES "bus_stop"("stop_id");
ALTER TABLE "tickets"
ADD CONSTRAINT "tickets_fk3" FOREIGN KEY ("conductor_id") REFERENCES "conductor"("conductor_id");
ALTER TABLE "tickets"
ADD CONSTRAINT "tickets_fk4" FOREIGN KEY ("plate_no") REFERENCES "vehicle"("plate_no");
ALTER TABLE "tickets"
ADD CONSTRAINT "tickets_fk5" FOREIGN KEY ("bus_no") REFERENCES "bus"("bus_no");
ALTER TABLE "conductor"
ADD CONSTRAINT "conductor_fk0" FOREIGN KEY ("plate_no") REFERENCES "vehicle"("plate_no");
ALTER TABLE "vehicle"
ADD CONSTRAINT "vehicle_fk0" FOREIGN KEY ("bus_no") REFERENCES "bus"("bus_no");
ALTER TABLE "vehicle"
ADD CONSTRAINT "vehicle_fk1" FOREIGN KEY ("stop_id") REFERENCES "bus_stop"("stop_id");