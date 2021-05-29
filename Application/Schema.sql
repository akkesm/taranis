-- Your database schema. Use the Schema Designer at http://localhost:8001/ to add some tables.
CREATE TABLE comparisons (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    skill1 TEXT NOT NULL,
    skill2 TEXT NOT NULL,
    winner INT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL
);
CREATE TABLE skills (
    id INT NOT NULL UNIQUE,
    name TEXT PRIMARY KEY NOT NULL UNIQUE,
    image TEXT NOT NULL
);
CREATE TABLE make_list_jobs (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    status JOB_STATUS DEFAULT 'job_status_not_started' NOT NULL,
    last_error TEXT DEFAULT NULL,
    attempts_count INT DEFAULT 0 NOT NULL,
    locked_at TIMESTAMP WITH TIME ZONE DEFAULT NULL,
    locked_by UUID DEFAULT NULL
);
