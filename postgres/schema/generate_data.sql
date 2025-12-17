INSERT INTO users(user_name, email, password_hash, created_at)

SELECT
   'User' || i,
   'user' || i || '@bmail.com',
   md5('supersecurepassword' || i),
   NOW()
FROM generate_series(1,500) AS s(i);

INSERT INTO users(user_name, email, password_hash, created_at)

SELECT
   'User' || i,
   'user' || i || '@gmail.com',
   md5('securepassword' || i),
   NOW()
FROM generate_series(1,350) AS s(i);

INSERT INTO users(user_name, email, password_hash, created_at)

SELECT
   'User' || i,
   'user' || i || '@yahoo.com',
   md5('password' || i),
   NOW()
FROM generate_series(1,150) AS s(i);

INSERT INTO payments(user_id,amount, currency, payment_status, created_at)

SELECT
   u.user_id,
   (10 + random() * 990)::numeric(10,2),
   CASE WHEN random() < 0.5 THEN 'USD' ELSE 'ZAR' END,
   CASE 
      WHEN random() < 0.7 THEN 'Completed'
      WHEN random() < 0.9 THEN 'Pending'
      ELSE 'Failed'
   END,
   NOW() - (random() * 1000)::int * interval '1 minute'
   FROM users u,
    generate_series(1,(1+ floor(random() * 5))::int) AS g(i);

INSERT INTO payments(user_id, amount,currency, payment_status, created_at)
VALUES (9899,500,'ZAR','Completed',NOW());

INSERT INTO payments(user_id, amount,currency, payment_status, created_at)
VALUES (5907,1500,'USD','Pending',NOW());

INSERT INTO payments(user_id, amount,currency, payment_status, created_at)
VALUES (3263,450,'USD','Completed',NOW());

INSERT INTO payments(user_id, amount,currency, payment_status, created_at)
VALUES (6583,500,'ZAR','Completed',NOW());

INSERT INTO payments(user_id, amount,currency, payment_status, created_at)
VALUES (9999,2500,'ZAR','Failed',NOW());

INSERT INTO payments(user_id, amount,currency, payment_status, created_at)
VALUES (500,2500,'ZAR','Failed',NOW());

INSERT INTO project_metadata(user_id, title, project_description, project_status, created_at, last_updated)

SELECT
   u.user_id,
   'project' || g.i || '_user' || u.user_id,
   'this is a project description' || g.i || 'for user' || u.user_id,
   CASE
      WHEN random() < 0.6 THEN 'Active'
      WHEN random() < 0.9 THEN 'Completed'
      ELSE 'Inactive'
   END,
   NOW() - (random() * 1000)::int * interval '1 minute',
   NOW() - (random() * 500)::int * interval '1 minute'

FROM users u,
   generate_series(1,(1+ floor(random() * 3))::int) AS g(i);

INSERT INTO project_metadata(user_id,title,project_description)
VALUES (9832,'Website Management','A website project');

INSERT INTO project_metadata(user_id,title,project_description)
VALUES (450,'Website Management','A website project');
