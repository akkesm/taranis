

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;


SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE public.comparisons DISABLE TRIGGER ALL;



ALTER TABLE public.comparisons ENABLE TRIGGER ALL;


ALTER TABLE public.make_list_jobs DISABLE TRIGGER ALL;



ALTER TABLE public.make_list_jobs ENABLE TRIGGER ALL;


ALTER TABLE public.skills DISABLE TRIGGER ALL;

INSERT INTO public.skills (id, name, image) VALUES (0, 'Spirit Blaze', '/pet_blaze.png');
INSERT INTO public.skills (id, name, image) VALUES (1, 'Spirit Freeze', '/pet_ice.png');
INSERT INTO public.skills (id, name, image) VALUES (2, 'Spirit Poisoned Touch', '/pet_poison.png');
INSERT INTO public.skills (id, name, image) VALUES (3, 'Spirit Bolt', '/pet_bolt.png');
INSERT INTO public.skills (id, name, image) VALUES (4, 'Poison Touch', '/poison.png');
INSERT INTO public.skills (id, name, image) VALUES (5, 'Bolt', '/bolt.png');
INSERT INTO public.skills (id, name, image) VALUES (6, 'Blaze', '/blaze.png');
INSERT INTO public.skills (id, name, image) VALUES (8, 'Holy Touch', '/holy_touch.png');
INSERT INTO public.skills (id, name, image) VALUES (9, 'Dark Touch', '/dark.png');
INSERT INTO public.skills (id, name, image) VALUES (10, 'Shadow Clone', '/shadow_clone.png');
INSERT INTO public.skills (id, name, image) VALUES (11, 'Summon One-eyed Bat', '/shadow_bat.png');
INSERT INTO public.skills (id, name, image) VALUES (12, 'Smart', '/smart.png');
INSERT INTO public.skills (id, name, image) VALUES (13, 'Strong Heart', '/strongheart.png');
INSERT INTO public.skills (id, name, image) VALUES (14, 'Spirit Multishot', '/pet_multishot.png');
INSERT INTO public.skills (id, name, image) VALUES (15, 'Spirit Front Arrow', '/pet_frontarrow.png');
INSERT INTO public.skills (id, name, image) VALUES (16, 'Giant', '/giant.png');
INSERT INTO public.skills (id, name, image) VALUES (17, 'Dwarf', '/dwarf.png');
INSERT INTO public.skills (id, name, image) VALUES (18, 'Poison Swords', '/sword_poison.png');
INSERT INTO public.skills (id, name, image) VALUES (19, 'Ice Swords', '/sword_ice.png');
INSERT INTO public.skills (id, name, image) VALUES (20, 'Fire Swords', '/sword_fire.png');
INSERT INTO public.skills (id, name, image) VALUES (21, 'Bolt Swords', '/sword_bolt.png');
INSERT INTO public.skills (id, name, image) VALUES (22, 'Toxic Strike', '/strike_poison.png');
INSERT INTO public.skills (id, name, image) VALUES (23, 'Frost Strike', '/strike_ice.png');
INSERT INTO public.skills (id, name, image) VALUES (24, 'Bolt Strike', '/strike_bolt.png');
INSERT INTO public.skills (id, name, image) VALUES (25, 'Fire Strike', '/strike_blaze.png');
INSERT INTO public.skills (id, name, image) VALUES (26, 'Toxic Meteor', '/meteor_poison.png');
INSERT INTO public.skills (id, name, image) VALUES (27, 'Frost Meteor', '/meteor_ice.png');
INSERT INTO public.skills (id, name, image) VALUES (28, 'Blazing Meteor', '/meteor_blaze.png');
INSERT INTO public.skills (id, name, image) VALUES (29, 'Bolt Meteor', '/meteor_bolt.png');
INSERT INTO public.skills (id, name, image) VALUES (30, 'Poison Circle', '/circle_poison.png');
INSERT INTO public.skills (id, name, image) VALUES (31, 'Ice Circle', '/circle_ice.png');
INSERT INTO public.skills (id, name, image) VALUES (32, 'Fire Circle', '/circle_blaze.png');
INSERT INTO public.skills (id, name, image) VALUES (33, 'Bolt Circles', '/circle_bolt.png');
INSERT INTO public.skills (id, name, image) VALUES (34, 'Obsidian Circle', '/circle_dark.png');
INSERT INTO public.skills (id, name, image) VALUES (35, 'Toxic Star', '/star_poison.png');
INSERT INTO public.skills (id, name, image) VALUES (36, 'Frost Star', '/star_ice.png');
INSERT INTO public.skills (id, name, image) VALUES (37, 'Blazing Star', '/star_blaze.png');
INSERT INTO public.skills (id, name, image) VALUES (38, 'Bolt Star', '/star_bolt.png');
INSERT INTO public.skills (id, name, image) VALUES (39, 'HP Plus', '/hp_plus.png');
INSERT INTO public.skills (id, name, image) VALUES (40, 'Crit Plus', '/crit_plus.png');
INSERT INTO public.skills (id, name, image) VALUES (41, 'Attack Plus', '/atk_plus.png');
INSERT INTO public.skills (id, name, image) VALUES (42, 'Speed Plus', '/atk_speed_plus.png');
INSERT INTO public.skills (id, name, image) VALUES (43, 'Fury', '/fury.png');
INSERT INTO public.skills (id, name, image) VALUES (44, 'Grace', '/grace.png');
INSERT INTO public.skills (id, name, image) VALUES (45, 'Agility', '/agility.png');
INSERT INTO public.skills (id, name, image) VALUES (46, 'Rage', '/rage.png');
INSERT INTO public.skills (id, name, image) VALUES (47, 'Crit Aura', '/crit_aura.png');
INSERT INTO public.skills (id, name, image) VALUES (48, 'Speed Aura', '/atk_speed_aura.png');
INSERT INTO public.skills (id, name, image) VALUES (49, 'Extra Life', '/extralife.png');
INSERT INTO public.skills (id, name, image) VALUES (50, 'Headshot', '/headshot.png');
INSERT INTO public.skills (id, name, image) VALUES (51, 'Diagonal Arrows', '/diag.png');
INSERT INTO public.skills (id, name, image) VALUES (52, 'Side Arrows', '/side.png');
INSERT INTO public.skills (id, name, image) VALUES (53, 'Rear Arrow', '/rear.png');
INSERT INTO public.skills (id, name, image) VALUES (54, 'Front Arrow', '/frontarrow.png');
INSERT INTO public.skills (id, name, image) VALUES (55, 'Multishot', '/multishot.png');
INSERT INTO public.skills (id, name, image) VALUES (56, 'Ricochet', '/ricochet.png');
INSERT INTO public.skills (id, name, image) VALUES (57, 'Piercing Shot', '/piercingshot.png');
INSERT INTO public.skills (id, name, image) VALUES (58, 'Bouncy Walls', '/bouncywall.png');
INSERT INTO public.skills (id, name, image) VALUES (59, 'Dodge Master', '/dodge.png');
INSERT INTO public.skills (id, name, image) VALUES (60, 'Invincibility Star', '/invincibility.png');
INSERT INTO public.skills (id, name, image) VALUES (61, 'Bloodthirst', '/bloodthirst.png');
INSERT INTO public.skills (id, name, image) VALUES (62, 'Though The Wall', '/wall.png');
INSERT INTO public.skills (id, name, image) VALUES (63, 'Water Walker', '/water.png');
INSERT INTO public.skills (id, name, image) VALUES (64, 'Death Bomb', '/deathbomb.png');
INSERT INTO public.skills (id, name, image) VALUES (65, 'Chilling Blash', '/chillingblast.png');
INSERT INTO public.skills (id, name, image) VALUES (66, 'Death Nova', '/deathnova.png');
INSERT INTO public.skills (id, name, image) VALUES (67, 'Wingman', '/wingman.png');
INSERT INTO public.skills (id, name, image) VALUES (68, 'Shield Guard', '/shield.png');
INSERT INTO public.skills (id, name, image) VALUES (69, 'Slow Projectile', '/slowprojectile.png');
INSERT INTO public.skills (id, name, image) VALUES (70, 'Attack Boost Major', '/atk_major.png');
INSERT INTO public.skills (id, name, image) VALUES (71, 'Attack Boost Minor', '/atk_minor.png');
INSERT INTO public.skills (id, name, image) VALUES (72, 'Attack Speed Boost Major', '/atk_speed_major.png');
INSERT INTO public.skills (id, name, image) VALUES (73, 'Attack Speed Boost Minor', '/atk_speed_minor.png');
INSERT INTO public.skills (id, name, image) VALUES (74, 'Crit Master Minor', '/crit_minor.png');
INSERT INTO public.skills (id, name, image) VALUES (75, 'Crit Master', '/crit_major.png');
INSERT INTO public.skills (id, name, image) VALUES (76, 'HP Boost', '/hp.png');
INSERT INTO public.skills (id, name, image) VALUES (77, 'Heal', '/heal.png');
INSERT INTO public.skills (id, name, image) VALUES (78, 'Strong Strong Heart', '/strongstrongheart.png');
INSERT INTO public.skills (id, name, image) VALUES (79, 'Elemental Burst', '/crit_elemental.png');
INSERT INTO public.skills (id, name, image) VALUES (80, 'Elemental Upgrade', '/atk_elemental.png');
INSERT INTO public.skills (id, name, image) VALUES (81, 'Hermes'' Shoes', '/hermes.png');
INSERT INTO public.skills (id, name, image) VALUES (82, 'Overdraft', '/overdraft.png');
INSERT INTO public.skills (id, name, image) VALUES (83, 'Freeze', '/ice.png');


ALTER TABLE public.skills ENABLE TRIGGER ALL;


