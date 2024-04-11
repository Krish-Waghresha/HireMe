create table applicant(
    aid serial primary key,
    aname varchar(20)
);

create table company(cid serial primary key,cname varchar(20));

create table job(

    cid serial references company(cid), 
    jid serial primary key,
    job_title varchar(20)

);

create table job_applicant(
    aid serial references applicant(aid),
    jid serial references job(jid)
);

insert into applicant(aname) values('krish');
insert into applicant values(default, 'viva');

insert into company values(default, 'infosys');
insert into company values(default, 'tcs');


insert into job values(1,default,'tester');
insert into job values(1,default,'dev');
insert into job values(2,default,'DBA');
insert into job values(2,default,'web dev');


insert into job_applicant values(1,1);
insert into job_applicant values(1,3);
insert into job_applicant values(1,4);
insert into job_applicant values(1,5);
insert into job_applicant values(2,1);
insert into job_applicant values(2,3);
insert into job_applicant values(2,4);
insert into job_applicant values(2,5);


select aname,cname,job_title from applicant,company,job,job_applicant where company.cid=job.cid and applicant.aid=job_applicant.aid and job.jid=job_applicant.jid; 
