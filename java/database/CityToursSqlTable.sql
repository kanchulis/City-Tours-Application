/*CREATE TABLE landmark
(
landmark_id serial NOT NULL,
name varchar(100) NOT NULL,
description varchar,
address varchar,
venue_type varchar(64) NOT NULL,
pending_approval boolean,

CONSTRAINT pk_landmark_id PRIMARY KEY (landmark_id)

);



----------



CREATE TABLE itinerary
(
itinerary_id serial NOT NULL,
name varchar(64),
starting_point varchar NOT NULL,
date_of DATE NOT NULL,
user_id int NOT NULL,
share int,

CONSTRAINT pk_itinerary_id PRIMARY KEY (itinerary_id),
CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users

);


----------


CREATE TABLE review
(
review_id serial NOT NULL,
title varchar,
description varchar,
thumbs_up boolean,
thumbs_down boolean,
landmark_id int,

CONSTRAINT pk_review_id PRIMARY KEY (review_id),
CONSTRAINT fk_landmark_id FOREIGN KEY (landmark_id) REFERENCES landmark

);

----------

CREATE TABLE business_hours
(
landmark_id int,
day_of int,
open_time time,
close_time time,

CONSTRAINT fk_landmark_id FOREIGN KEY (landmark_id) REFERENCES landmark,
CONSTRAINT day_of check(day_of > 0 AND day_of < 8)
);

----------

CREATE TABLE destinations
(
itinerary_id int,
landmark_id int,

CONSTRAINT fk_landmark_id FOREIGN KEY (landmark_id) REFERENCES landmark,
CONSTRAINT fk_itinerary_id FOREIGN KEY (itinerary_id) REFERENCES itinerary
);

----------

CREATE TABLE images
(
landmark_id int,
image_url varchar,

CONSTRAINT fk_landmark_id FOREIGN KEY (landmark_id) REFERENCES landmark,
CONSTRAINT fk_review_id FOREIGN KEY (review_id) REFERENCES review

);

CREATE TABLE accessibility
(
itinerary_id int,
user_id int,

CONSTRAINT fk_itinerary_id FOREIGN KEY (itinerary_id) REFERENCES itinerary,
CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users

);*/


/**************
***LANDMARKS***
***************/

INSERT INTO landmark (name, description, address, venue_type, pending_approval) VALUES ('Auditorium Shores at Town Lake Metropolitan Park', 'Auditorium Shores is an urban park located in downtown Austin, Texas, within the larger Town Lake Park. Its name refers to its location between the former Palmer Auditorium and the shores of Lady Bird Lake.', '900 W Riverside Dr, Austin, TX 78704', 'Parks & Gardens', false);
INSERT INTO landmark (name, description, address, venue_type, pending_approval) VALUES ('Barton Creek Greenbelt', 'The Barton Creek Greenbelt located in Austin, Texas is managed by the City of Austin''s Park and Recreation Department.', '3755 S Capital of Texas Hwy B, Austin, TX 78704', 'Parks & Gardens', false);
INSERT INTO landmark (name, description, address, venue_type, pending_approval) VALUES ('McKinney Falls State Park', 'McKinney Falls State Park is a state park in Austin, Texas, United States at the confluence of Onion Creek and Williamson Creek. It is administered by the Texas Parks and Wildlife Department.', '5808 McKinney Falls Pkwy, Austin, TX 78744', 'Parks & Gardens', false);
INSERT INTO landmark (name, description, address, venue_type, pending_approval) VALUES ('Lady Bird Lake', 'Lady Bird Lake is a river-like reservoir on the Colorado River in Austin, Texas, United States. The City of Austin created the reservoir in 1960 as a cooling pond for a new city power plant. The lake, which has a surface area of 416 acres, is now used primarily for recreation and flood control.', 'Lady Bird Lake First Street Bridge at Lady Bird Lake, Austin, TX 78701', 'Parks & Gardens', false);
INSERT INTO landmark (name, description, address, venue_type, pending_approval) VALUES ('Zilker Botanical Garden', 'The Zilker Botanical Garden is a botanical garden of varied topography located on the south bank of the Colorado River at 2220 Barton Springs Road, near downtown Austin, Texas, United States. The Botanical Garden was established as a non-profit organization in 1955, and is the centerpiece of Zilker Park.', '2220 Barton Springs Rd, Austin, TX 78746', 'Parks & Gardens', false);
INSERT INTO landmark (name, description, address, venue_type, pending_approval) VALUES ('Texas Capitol', 'The Texas State Capitol is the capitol building and seat of government of the American state of Texas. Located in downtown Austin, Texas, the structure houses the offices and chambers of the Texas Legislature and of the Governor of Texas.', '1100 Congress Ave, Austin, TX 78701', 'Museums & Historical Sites', false);
INSERT INTO landmark (name, description, address, venue_type, pending_approval) VALUES ('Bullock Texas State History Museum', 'The Bullock Texas State History Museum (often referred to as the Bob Bullock Texas State History Museum or Bullock Museum) is a history museum dedicated to interpreting the continually unfolding "Story of Texas" to the broadest possible audience through meaningful educational experiences.', '1800 Congress Ave, Austin, TX 78701', 'Museums & Historical Sites', false);
INSERT INTO landmark (name, description, address, venue_type, pending_approval) VALUES ('Blanton Museum of Art', 'The Jack S. Blanton Museum of Art at the University of Texas at Austin is one of the largest university art museums in the U.S. with 189,340 square feet devoted to temporary exhibitions, permanent collection galleries, storage, administrative offices, classrooms, a print study room, an auditorium, shop, and cafe.', '200 E Martin Luther King Jr Blvd, Austin, TX 78712', 'Museums & Historical Sites', false);
INSERT INTO landmark (name, description, address, venue_type, pending_approval) VALUES ('LBJ Presidential Library', 'The Lyndon Baines Johnson Library and Museum, also known as the LBJ Presidential Library, is the presidential library and museum of Lyndon Baines Johnson, the 36th President of the United States.', '2313 Red River St, Austin, TX 7870', 'Museums & Historical Sites', false);
INSERT INTO landmark (name, description, address, venue_type, pending_approval) VALUES ('Museum of the Weird', 'Museum featuring an array of curios & oddities, from Bigfoot to shrunken heads, plus a gift shop.', '412 E 6th St, Austin, TX 78701', 'Museums & Historical Sites', false);
INSERT INTO landmark (name, description, address, venue_type, pending_approval) VALUES ('Franklin Barbecue', 'Long lines form early for brisket, pulled pork & other smoked meats at this lunch-only spot.', '900 E 11th St, Austin, TX 78702', 'Restaurants', false);
INSERT INTO landmark (name, description, address, venue_type, pending_approval) VALUES ('Jack Allen''s Kitchen Oak Hill', 'Lively restaurant & bar for upscale Southwestern cuisine made with ingredients from local farms.', '7720 W Highway 71 Austin, TX 78735', 'Restaurants', false);
INSERT INTO landmark (name, description, address, venue_type, pending_approval) VALUES ('Stiles Switch BBQ', 'BQ joint in Violet Crown shopping center for smoked meats & local draft beer amid old-school decor.', '6610 N Lamar Blvd, Austin, TX 78752', 'Restaurants', false);
INSERT INTO landmark (name, description, address, venue_type, pending_approval) VALUES ('Uchi', 'Sushi plus creative hot & cold dishes from chef Tyson Cole in a stylish, sophisticated setting.', '801 S Lamar Blvd, Austin, TX 78704', 'Restaurants', false);
INSERT INTO landmark (name, description, address, venue_type, pending_approval) VALUES ('Terry Black''s Barbecue', 'Spacious, casual stop for pit-smoked meats & housemade sides from famous 4th-generation pitmasters.', '1003 Barton Springs Rd, Austin, TX 78704', 'Restaurants', false);
INSERT INTO landmark (name, description, address, venue_type, pending_approval) VALUES ('2nd Street District', 'Vibrant area featuring stylish boutiques & restaurants with global cuisine, plus a live music scene.', '214 Guadalupe St, Austin, TX 78701', 'Shopping', false);
INSERT INTO landmark (name, description, address, venue_type, pending_approval) VALUES ('Uncommon Objects', 'Quirky shop featuring an eclectic array of antiques, including jewelry, taxidermy, gadgets & toys.', '1602 Fortview Rd, Austin, TX 78704', 'Shopping', false);
INSERT INTO landmark (name, description, address, venue_type, pending_approval) VALUES ('Atown', 'Large strip-mall shop featuring clothing accessories, jewelry & gift items, many from local artists.', '5502 Burnet Rd, Austin, TX 78756', 'Shopping', false);
INSERT INTO landmark (name, description, address, venue_type, pending_approval) VALUES ('Allens Boots', 'Landmark store with more than 4,000 boots on display, plus cowboy hats, clothing & accessories.', '1522 S Congress Ave, Austin, TX 78704', 'Shopping', false);
INSERT INTO landmark (name, description, address, venue_type, pending_approval) VALUES ('Waterloo Records & Video', ' Longtime hot spot with in-store performances, local artist compilations & concert ticket sales.', '600 N Lamar Blvd, Austin, TX 78703', 'Shopping', false);
INSERT INTO landmark (name, description, address, venue_type, pending_approval) VALUES ('Inner Space Cavern', 'Inner Space Cavern is a karst cave located in Georgetown, Texas. The cavern was carved by water passing through Edwards limestone. The cavern is estimated to be 90–100 million years old but were only open to the surface since the late Pleistocene period 20,000–45,000 years ago.', '4200 S IH 35 Frontage Rd, Georgetown, TX 78626', 'Kid-Friendly', false);
INSERT INTO landmark (name, description, address, venue_type, pending_approval) VALUES ('Austin Zoo', 'Austin Zoo is a non-profit rescue zoo and located in southwestern unincorporated Travis County, Texas, United States, west of Austin. The zoo is accredited by the Zoological Association of America. The mission of Austin Zoo is to assist animals in need through rescue, rehabilitation, and education.', '10808 Rawhide Trail, Austin, TX 78736', 'Kid-Friendly', false);
INSERT INTO landmark (name, description, address, venue_type, pending_approval) VALUES ('Lady Bird Johnson Wildflower Center', 'The Lady Bird Johnson Wildflower Center at The University of Texas at Austin is the state botanical garden and arboretum of Texas. The center features more than 900 species of native Texas plants in both garden and natural settings and is home to a breadth of educational programs and events.', '4801 La Crosse Ave, Austin, TX 78739', 'Kid-Friendly', false);
INSERT INTO landmark (name, description, address, venue_type, pending_approval) VALUES ('Thinkery', 'Interactive kids museum with science exhibits, art, indoor & outdoor play spaces & story time.', '1830 Simond Ave, Austin, TX 78723', 'Kid-Friendly', false);
INSERT INTO landmark (name, description, address, venue_type, pending_approval) VALUES ('Austin Aquarium', 'The Austin Aquarium is a for profit aquarium located in Austin, Texas, United States, that opened to the public December 12, 2013. It is home to thousands of different species of reptiles, exotic birds and marine animals.', '13530 US-183 #101, Austin, TX 78750', 'Kid-Friendly', false);

/************
***REVIEWS***
*************/

INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('Prom pictures', true, false,'1','Stopped here to take prom pics so we could get the lake and Austin skyline in the pics!! The view was absolutely beautiful and we had awesome lighting. This was definitely a good spot to take pics..');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('Delightful Dog Park', true,false,'1','We took our two dogs to Auditorium Shores when we were visiting Austin. It''s a great place for them! It''s huge, with lots of room for them to run off leash. The whole area is clean and nicely maintained, especially considering how well attended it is, and there were many other dogs for them to play with.');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('Good area for running, walking, picnics', true,false,'1','Auditorium Shores is a large green (well, in the right season) outdoor area. Many runners and pet owners spend their evenings and weekends there. Great place in downtown Austin for a peaceful walk and some Austin skyline.');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('Beautiful but hard to get to', true,false,'2','This is a definite asset in Austin, but we were confused by the different accounts of how to find the trail heads and where to park. Once on the trail, it was quite lovely.');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('potential',false, true,'2','i really enjoyed the trail when i could. there were many areas under maintenance so it was a short bike ride for me');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('What a gem located in the middle of Austin!!', true,false,'2','Crystal clear spring feed water with grass, trees and shade on both sides for sunbathing and relaxing. Refreshing swim in 68 degree water..the perfect way to cool off on a hot Summer day.');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('Not worth it.',false, true,'3','Too much litter and the water is murky. The park is also teeming with state police who will make you feel uncomfortable - especially officer Wallace who will racially profile you unless you''re white. Do not bring your families here.');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('Camping Near Austin', true,false,'3','We camped here in a fifth wheel trailer while we spent time seeing the sights of Austin, TX. Nice hiking trails, well-spaced camp sites, wildlife and waterfalls.');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('Lovely park', true,false,'3','Even in February, this local park was just beautiful. The Falls area is heavily touristed, but there is plenty of space to move around. Loads of picnic sites. Nice trail.');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('Slight on the lake', true,false,'4','So much going on from the herons to the boaters. Lovely scooter friendly walk/ride. We started at the “bat bridge” where we watched the bats fly out last night - delightful for sure.');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('Town lake is a must for locals or visitors.', true,false,'4','Austin’s downtown lake is a true gem that should be enjoyed by all. There are long and short options and the terrain is suitable for casual or energetic people. The views are amazing and hard to believe in the midst of a huge city.');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('What a joy in midst of a robust city!', true,false,'4','Let''s face it Austin population and traffic are exploding! Lady Bird Lake is a great oasis in middle of city! I''ve always loved the area.');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('magical', true,false,'5','what a magical space with various nooks and crannies to explore. an entrance fee of about $15. there’s a beautiful waterfall, as well as a section about the jurassic period. the zen garden was my favorite.');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('Beautiful Floral Gardens.', true,false,'5','Beautiful Floral Gardens. Great place for a family portrait or just to have a nice walk around the gardens. The scenery is spectacular and the aroma is just out of this world.');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('Pleasant Stroll',false, true,'5','Granted I came in winter which not the idea time so it looked a little barren. Saw some carp in the ponds, a couple of butterflies. The pathways were uneven and you must pay attention or risk falling. It was a pleasant stroll but nothing more.');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('A nice surprise', true,false,'6','The Texas State Capitol is a must see if you’re in Austin. The architecture is in incredible, and we really enjoyed learning more about Texas history. It’s free to get in, you just have to go through a metal detector. I would suggest getting there early in order to beat the crowd.');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('One of the Most Beautiful Capitol Buildings', true,false,'6','I have been to dozens of state capitals, but this is one of the best. The building is shiny and an interesting brown color. It is one of the top buildings, but I still don’t think too much of the buildings. I normally stop for 2 pictures and then leave.');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('Brilliant', true,false,'6','Absolutely beautiful building inside and out and a very interesting piece of history. the grounds and statues etc are well worth the time to walk around and peruse. Do not miss this place for a visit.');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('Great museum', true,false,'7','Really enjoyed my visit here. Texas history pre 1821 to the present. Also, an IMAX theater,a cafe, special exhibits and a special exhibit gallery. Very nice.');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('Excellent review of the history of Texas', true,false,'7','Do yourself a favour and pay this museum a visit, well worth the time. Very interesting and a great deal of history to cover and learn.');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('Boring',false, true,'7','Went between Christmas and New Year''s and it was a mistake. Too many kids running around that don''t care about the exhibits. The overall material in the museum wasn''t great either. Poorly organized. I wouldn''t go back.');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('Wonderful Museum', true,false,'8','We enjoyed the art collection very much. We also enjoyed the live music while we were visiting. They possess some great art and sculptures in this museum.');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('Free Thursdays', true,false,'8','The building itself is big and beautiful as is the collection. A little bit of everything. Lots of space see you never feel him down or overwhelmed by too many paintings at once.');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('A Disappointment',false, true,'8','My husband and I are museum goers and we were pretty disappointed with this museum. It isn''t very big and the artwork wasn''t anything special. You are better off going to the San Antonio Museum of Art.');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('Pleasantly surprised', true,false,'9','This turned out to be way more interesting than I expected. All the bills he passed that benefitted middle class and poor. He was more of a character than I learned in school too. Highly recommend this place.');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('Great Educational Experience', true,false,'9','The Library is a great space to learn about American History during the Johnson Administration. President Johnson was on of the greatest presidents who improved the lives of all American.');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('Interesting', true,false,'9','One of three Presidential Libraries in Texas. It is a must see when visiting Austin. The modern architecture is not my favorite, but inside is very nice. The replica of the Oval Office is beautiful and many of President Johnson''s personal possessions are on display. A must see!');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('Quirky', true,false,'10','This is a fun and interesting attraction. The live show was good fun and the artifacts were interesting to read. Prices were good and the staff was easy to talk to and very friendly.');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('Not worth the money spent',false, true,'10','Very small ”museum”, it was a waste of money to go there. Can’t recommend!! The man who performed a ”live show” started complaining about not being paid, asking for tips. The fee to the museum was too expensive and then they expect the visitors to start paying his salary too??');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('So weird', true,false,'10','A fun way to spend an early Saturday morning. Cool collection of weird and unimaginable items. Fun gift shop.');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('Hands down BEST! Barbecue', true,false,'11','Hands down BEST! Barbecue food my husband and I have ever had in our lives!!!! The brisket was succulent,tender, flavorful and perfectly cooked!!!!!');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('Worth it', true,false,'11','Simply amazing. And the pick up system during Covid19 was incredibly easy. Brisket lived up to the hype and the Bourbon Banana tart was heavenly. All hail the folks at Franklin BBQ!');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('Delicious Barbecue', true,false,'11','Having been a quite a few barbecue restaurants in Austin, we had very high expectations when we visited Franklin. And I must say we were not disappointed!! ');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('What a Treat!', true,false,'12','Every single thing we ordered was fresh and delicious. All food was prepared correctly. You will find unusual items on the menu that invite exploring and will not disappoint.');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('lunch with friends', true,false,'12','very good food, good service, price was good for what we ate, was seated fairly quickly on a busy afternoon');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('Food was great but service was better.', true,false,'12','We came here and ordered all the specials. The food was incredible. What really made the experience was our server Mark. Best service I’ve ever had. Go in and ask for mark you won’t be disappointed');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('Good food, casual atmosphere', true,false,'13','Very good food, large portions, and quick service. Apparently very popular, we missed the dinner rush, so we received very quick service. Highly recommend');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('Fantastic', true,false,'13','Best bbq I''ve had in years. I loved the beef ribs. Great corn casserole. Pulled pork was also good. From the sauce to the rub. Amazing.');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('Horrible dinner experience',false, true,'13','Brisket was very greasy. They mostly use cheap ingredients. Mac and cheese was disgusting. Turkey breast was processed not real one. Pulled pork was ok-ish..not the best but compared to the rest of the food was edible');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('Memorable Meal', true,false,'14','My husband and I have had this on our list of Austin restaurants to visit for years. Why did we wait?! One of the most memorable meals we''ve ever had in the United States, it was that special.');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('Everything was just amazing!', true,false,'14','I don''t eat raw fish but I had some amazing dishes in the restaurant. Definitely worth every penny! One of the best, if not, the best restaurant in Austin. And this is coming from a hard core New Yorker!');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('Amazing Japanese Food!!', true,false,'14','One of the best places in Austin. I loved the fried milk and the Zere Sen roll. The Walu Walu is also amazing. Will definitely be back!');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('Really good brisket!', true,false,'15','It''s kind of a cafeteria style setup. You walk up to the counter, pick your sides, then pick your meat, then pay at the counter. Plenty of outdoor seating. Everything I had was delicious and I would definitely go again!');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('Average - I was hoping for more!',false, true,'15','My friend and I had lunch here recently and honestly, it was just average. The brisket was very good, the potato salad was forgettable, the cornbread was amazing, and the pinto beans were again simply average.');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('This place has the best food', true,false,'15','This place has the best food I’ve had in my life. I had the brisket and jalapeño sausage and will probably have the same tomorrow.');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('Unprofessional businesses',false, true,'16','Very congested parking, very unclear about parking tickets, business owners and staff seem to not be aware and are of no help. Plus very trashy streets and unkept grass and vagrants on every street corner. Very disturbing.');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('Shopping in Austin', true,false,'16','Different shipping venue in Austin. We have always hit Congress Street for fun shopping and we were looking for something a little different this weekend. We tried 2nd Street District based on Yelps recommendation.... it was fun and we found some nice shops to browse through, later some nice refreshments to enjoy. ');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('Coffee and shopping on 2nd Street.', true,false,'16','We enjoyed strolling along 2nd street and did a bit of shopping and stopped for coffee along the way.');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('Always worth the stop!', true,false,'17','My wife and I have literally been to flea markets and antique malls From coast to coast and this is by far our favorite.');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('It fell far short. Left me very unsatisfied.',false, true,'17','Though I was very much looking forward to browsing this operation I did not find it at all interesting or valuable.');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('Visual Treat for all ages.', true,false,'17','The aesthetic of this place is phenomenal. The different presentations and collections make you feel in a vintage madhouse');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('Bigger than I thought', true,false,'18','The ladies at the shop was very nice. The store amazed me of how big the size is of the whole store. I love all the hand made items and recycled items in the store like a recycled bag made from bottles or those rubber coasters.');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('Cool gift shop', true,false,'18','This is a great gift shop! Lots of local, eclectic items to choose from. The staff was really friendly too. I wounded up getting this great-smelling soap specifically for Leos (like I am!) and I doubt I could find something like this anywhere else.');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('Great Variety!', true,false,'18','Great selection of everything from t-shirts, candles, jewelry, stickers, housewares, baby gifts, clothing and more! I love the wide variety of items at a variety of price points.');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('the place for real cowboy boots', true,false,'19','What a store! thousands of boots to choose from for eavery age and style. bought some for my 3 year old grand daughter. fab.');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('Must have boots', true,false,'19','My daughter wanted a pair of cowgirl boots since relocating to Texas. She of course found a pair that was exactly what she had envisioned. They let us hold them until the next day so we could make sure they were perfect for her.');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('Stop in- fun to look around', true,false,'19','This is a fun place just to see from the outside, with its cool signs. But, pop in- huge store and it is serve yourself so you can try on boots and hats.');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('A Record Store For Everything', true,false,'20','Used and new CDs and LPs are in genre and alphabetical order, reasonably priced. The sales staff is knowledgeable and friendly and you''ll find just about anything you''re looking for. It''s a solid \"11\" for cool.');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('So much cool stuff!', true,false,'20','New vinyl, old vinyl. New CD''s, Old CD''s. Clothing. Posters. Action figures. Toys. Boxed sets. Grab bags. etc, etc, etc.');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('A Music Lovers Dream', true,false,'20','I went in here thinking it was just a place to kill time. I was completely taken aback by how large this store was. They had records, CDs, stickers, magnets, shirts, every quirky thing you could think of.');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('Great cave system and fun for everyone', true,false,'21','great local cave system. tour guide was funny and educating. we love taking people to visit Not very crowded and easy to get to.');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('Lovely and informative', true,false,'21','We thouroughly enjoyed our trip. It was my first time so we went on the normal basic pathed walk. We had Rachel as our tour guide. She was very informative and funny. We will definitely return for another one of their tours.');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('Interesting but too expensive',false, true,'21','We took the 1 hr tour which cost $61 for two adults and a 10 yr old-way too expensive to look at limestone.');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('Supporting rescue efforts', true,false,'22','Your money is supporting these rescue animals. Yes it is small but still takes 2+ hours to see everything. Great for kids and older adults who tire easily but want to go. Stop comparing to bigger profit zoos!!');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('Fun time great price', true,false,'22','This was a really fun little walk through! Not your typical concrete jungle kind of zoo! It was cute that they did a birthday cake celebration for the bears! Overall we really enjoyed it! The price was very reasonable');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('Quaint zoo, but great little excursion with family', true,false,'22','Gravel trails, good variety of animals, nice little train to ride around (especially if you bring kids). I had heard that it wasn''t great, but it turned out to be a very nice way to get out with the family.');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('Good Place for Everyone', true,false,'23','Not a lot blooming when we were there but good walking paths. This would be a great place spring through fall.');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('Texas Beauty', true,false,'23','One can come to this center any time of the year and learn something. If the flowers are in bloom, it is exquisite! Well thought out and organized. A great side trip. Also near other side trips.');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('Excellent Walking Area', true,false,'23','We enjoyed walking all around the gardens. There are so many flower gardens to enjoy. Even though it is early Spring the time spent here was well worth it.');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('So much fun for everyone', true,false,'24','Thinkery is a special place that each of our grandkids really enjoy. There is a wide variety so that each child can find the experiences they most connect with.');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('Young kids to Teens', true,false,'24','A good place for younger kids to explore new things and a place for kids to show there creativity. It is really nice to see kids exploring and enjoying every bit of it.');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('Wonderful fun day of learning.', true,false,'24','My granddaughter, my daughter-in-law and I had another great day at the Thinkery. Always something new to explore. Love spending our day in a familiar place that’s made especially for young inquiring minds.');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('very disappointing',false, true,'25','Located in a small difficult to get to strip mall. Really not an aquarium as there are birds, lizards, snakes and lemurs with scattered fish displays which are uniformally very poorly labeled.');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('No information on what the animals are',false, true,'25','There are many interesting and worthwhile displays at the aquarium. However, the value of the displays is largely lost because the information the museum staff provide to the visitor is either non-existent of so bad that it is impossible to read.');
INSERT INTO review (title,thumbs_up,thumbs_down,landmark_id,description) VALUES ('Great place to take your mind off of everyday life!!', true,false,'25','All the animals were great to look at to take your mind off of everyday life. I feed an alligator. Not by hand!! By fishing pole. It was awesome and me and my daughter got to go in the bird and bunny cage for free.');

/***********
***IMAGES***
************/

INSERT INTO images (landmark_id,image_url) VALUES ('1','https://upload.wikimedia.org/wikipedia/commons/3/3d/Auditorium_Shores_%282007%29.jpg');
INSERT INTO images (landmark_id,image_url) VALUES ('1','https://myareanetwork-photos.s3.amazonaws.com/bizlist_photos/f/170752_1528819518.jpg');
INSERT INTO images (landmark_id,image_url) VALUES ('1','https://live.staticflickr.com/7131/7654466322_4aceb1dcb5_3k.jpg');
INSERT INTO images (landmark_id,image_url) VALUES ('2','http://do512family.com/wp-content/uploads/2016/07/sculpturefalls-1.jpg');
INSERT INTO images (landmark_id,image_url) VALUES ('2','https://s3.amazonaws.com/crowdriff-media/full/6b8fbcc8ea8997f67e63e9f73686020a63766a4b69e80c4b9529c302bda27ed1.jpg');
INSERT INTO images (landmark_id,image_url) VALUES ('2','https://media.cntraveler.com/photos/5a7cb3d9833f8a477b949468/master/pass/Barton-Creek-Greenbelt__2018_Barton-Creek-Green-belt_Austin-Parks-and-Recreation-Department-(1).jpg');
INSERT INTO images (landmark_id,image_url) VALUES ('3','https://assets.simpleviewinc.com/simpleview/image/fetch/c_fill,h_396,q_75,w_704/https://assets.simpleviewinc.com/simpleview/image/upload/crm/austin/McKinney-Falls_7586-6c76496804b1843_6c764b27-0839-df1b-2b507a091dbbbdbb.jpg');
INSERT INTO images (landmark_id,image_url) VALUES ('3','https://savebartoncreek.org/explorersguide/wp-content/uploads/sites/2/2019/08/mckinney-falls-swimming.jpg');
INSERT INTO images (landmark_id,image_url) VALUES ('3','https://a.travel-assets.com/findyours-php/viewfinder/images/res40/34000/34742-Mckinney-Falls-State-Park.jpg');
INSERT INTO images (landmark_id,image_url) VALUES ('4','https://res.cloudinary.com/simpleview/image/upload/v1521489818/clients/austin/Lady_Bird_Lake_Credit_Johannes_Schneemann_courtesy_of_RootsRated_7372b2ec-02b4-4a0f-9a22-ae9c4a176c13.jpg');
INSERT INTO images (landmark_id,image_url) VALUES ('4','https://www.kut.org/sites/kut/files/styles/x_large/public/201806/lady_bird_lake_1.jpg');
INSERT INTO images (landmark_id,image_url) VALUES ('4','https://shoalcreekconservancy.org/wp-content/uploads/2014/08/boardwalkdowntown-1.jpg');
INSERT INTO images (landmark_id,image_url) VALUES ('5','https://www.austinmonitor.com/wp-content/uploads/2019/06/7058497451_d26a0490c5_k-620x365.jpg');
INSERT INTO images (landmark_id,image_url) VALUES ('5','https://1.bp.blogspot.com/-MksaFPtv74s/WTFhrhcic-I/AAAAAAAAAY0/iL8cqfuTLfk6qOkza_CfBQIC1hy7VynbACLcB/s1600/footbridge.JPG');
INSERT INTO images (landmark_id,image_url) VALUES ('5','https://i.pinimg.com/originals/e4/0f/21/e40f21c6678d97e550debe42cf805131.jpg');
INSERT INTO images (landmark_id,image_url) VALUES ('6','https://assets.simpleviewinc.com/simpleview/image/fetch/c_fill,h_594,q_75,w_800/https://assets.simpleviewcms.com/simpleview/image/upload/v1/clients/austin/Texas_State_Capitol_South_Facade_2015_Courtesy_of_the_Texas_State_Preservation_Board_FOR_ACVB_USE_ONLY_2_5475363b-0fb9-4455-9d69-037c8f7f2aa1.jpg');
INSERT INTO images (landmark_id,image_url) VALUES ('6','https://theculturetrip.com/wp-content/uploads/2019/01/kj3rtj.jpg');
INSERT INTO images (landmark_id,image_url) VALUES ('6','https://pubext.dir.texas.gov/portal/internal/resources/ImageLibrary/Domain%20Name%20Registration/2014-April.jpg');
INSERT INTO images (landmark_id,image_url) VALUES ('7','https://www.thestoryoftexas.com/upload/images/visit/bullock-exterior.jpg?1453143330');
INSERT INTO images (landmark_id,image_url) VALUES ('7','https://www.thestoryoftexas.com/upload/images/exhibits/becoming-texas/becomingtexas-labelle-gallery.jpg');
INSERT INTO images (landmark_id,image_url) VALUES ('7','https://www.thestoryoftexas.com/upload/images/exhibits/life-and-death-on-the-border/life-and-death-exhibit-4.jpg');
INSERT INTO images (landmark_id,image_url) VALUES ('8','https://www.phaidon.com/resource/austin-3-southeast-view.jpg');
INSERT INTO images (landmark_id,image_url) VALUES ('8','https://kimbermodern.com/wp-content/uploads/2018/09/Blanton-Museum-of-Art-Austin.jpg');
INSERT INTO images (landmark_id,image_url) VALUES ('8','https://blantonmuseum.s3.us-east-2.amazonaws.com/files/20190319095325/JeffreyGibson_008-e1553007745132.jpg');
INSERT INTO images (landmark_id,image_url) VALUES ('9','https://txhillcountrytrail.com/public/upload/txhillcountrytrail_com/images/sites/LBJmuseum.jpg');
INSERT INTO images (landmark_id,image_url) VALUES ('9','https://www.cortinaproductions.com/wp-content/uploads/2015/03/2013AV43.4341-1000x600.jpg');
INSERT INTO images (landmark_id,image_url) VALUES ('9','https://res.cloudinary.com/simpleview/image/upload/v1550612281/clients/austin/LBJ_Library_Oval_Office_Photo_Credit_Lauren_Gerson_Full_Usage_Permissions_408c85a1-fec9-4fd8-ba7a-45cb31f913c7.jpg');
INSERT INTO images (landmark_id,image_url) VALUES ('10','https://assets.simpleviewinc.com/simpleview/image/fetch/c_limit,q_75,w_1200/https://assets.simpleviewinc.com/simpleview/image/upload/crm/austin/museum-of-the-weird-ee8d7831042d4ba_ee8d7949-d7f3-bd48-21ac6cb9d2b50163.jpg');
INSERT INTO images (landmark_id,image_url) VALUES ('10','https://i2.wp.com/www.museumoftheweird.com/wp-content/uploads/2012/02/6330993462_2381312d99_o-1024x678.jpg?resize=553%2C366');
INSERT INTO images (landmark_id,image_url) VALUES ('10','https://www.whatsoninaustin.net/wp-content/uploads/2018/07/Museum-of-the-Weird.jpg');
INSERT INTO images (landmark_id,image_url) VALUES ('11','https://miro.medium.com/max/5000/1*IR7d_xLCjeYWgkjROQSahw.jpeg');
INSERT INTO images (landmark_id,image_url) VALUES ('11','https://franklinbbq.com/assets/img/samples/plate.jpg');
INSERT INTO images (landmark_id,image_url) VALUES ('11','https://3q87le1gsko01ibim33e4wib-wpengine.netdna-ssl.com/wp-content/uploads/2020/06/franklinbarbecue-21200xx5760-3246-0-592-640x440.jpg');
INSERT INTO images (landmark_id,image_url) VALUES ('12','https://cdn.vox-cdn.com/thumbor/C9MN_wkHeuSdoemr60SYgRqYqjc=/0x0:2011x1340/1200x900/filters:focal(846x503:1166x823)/cdn.vox-cdn.com/uploads/chorus_image/image/55143997/JackAllenKitchen.0.0.jpg');
INSERT INTO images (landmark_id,image_url) VALUES ('12','https://assets.simpleviewinc.com/simpleview/image/fetch/c_limit,q_75,w_1200/https://assets.simpleviewinc.com/simpleview/image/upload/crm/austin/JAK-OH-exterior-89e3a444f495701_89e3a565-9412-bc7d-3f4221d69b601ca1.jpg');
INSERT INTO images (landmark_id,image_url) VALUES ('12','https://communityimpact.com/uploads/images/2019/12/02/22448.jpg');
INSERT INTO images (landmark_id,image_url) VALUES ('13','https://img.texasmonthly.com/2014/11/Stiles-Switch-Sign.jpg?auto=compress&crop=faces&fit=fit&fm=jpg&h=0&ixlib=php-1.2.1&q=45&w=1120');
INSERT INTO images (landmark_id,image_url) VALUES ('13','https://media.timeout.com/images/103329116/image.jpg');
INSERT INTO images (landmark_id,image_url) VALUES ('13','https://images.squarespace-cdn.com/content/v1/55aa8765e4b069b20edce05b/1484676099579-S5J7U9UV6KC7L7D4XJF3/ke17ZwdGBToddI8pDm48kLLRZr_URuMx1XRor91jPlN7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z5QPOohDIaIeljMHgDF5CVlOqpeNLcJ80NK65_fV7S1UUPXZMcYU7OzEOVNaXAwc7bKTofde8q-DVDdaHhjDEsnHdh73UISBpoRTMigzSIXqQ/party6.jpg');
INSERT INTO images (landmark_id,image_url) VALUES ('14','https://cdn.vox-cdn.com/thumbor/oE4e0uOVm3-LnFJ6jBseV1ep1G4=/0x0:3936x2624/1200x800/filters:focal(1654x998:2282x1626)/cdn.vox-cdn.com/uploads/chorus_image/image/59515577/Uchi_Austin_Wagyu_Yaki_Onigiri_Photo_Credit_Logan_Crable_Late_Night_Specials_2.0.0.jpg');
INSERT INTO images (landmark_id,image_url) VALUES ('14','https://images1.westword.com/imager/u/original/10862240/uchi-20181003-lirette004.jpg');
INSERT INTO images (landmark_id,image_url) VALUES ('14','https://res.cloudinary.com/culturemap-com/image/upload/ar_4:3,c_fill,g_faces:center,w_1200/v1493160438/photos/80991_original.jpg');
INSERT INTO images (landmark_id,image_url) VALUES ('15','https://www.austinchronicle.com/imager/b/original/1527716/1f97/rsz_meat-tray.jpg');
INSERT INTO images (landmark_id,image_url) VALUES ('15','https://www.austinchronicle.com/binary/eedf/food_feature3-1.jpg');
INSERT INTO images (landmark_id,image_url) VALUES ('15','https://texasbbqposse.com/wp-content/uploads/2017/06/Terry-Blacks-BBQ-exterior.jpg');
INSERT INTO images (landmark_id,image_url) VALUES ('16','https://pagethink.com/media/uploads/project-gallery-images/lg_1_2ndst.jpg');
INSERT INTO images (landmark_id,image_url) VALUES ('16','https://austinot.com/wp-content/uploads/2019/09/2ND-Street-District-Austin.jpg');
INSERT INTO images (landmark_id,image_url) VALUES ('16','https://assets.simpleviewinc.com/simpleview/image/fetch/c_fill,h_667,q_75,w_1000/https://assets.simpleviewinc.com/simpleview/image/upload/v1/clients/austin/DSC08738_1334c38b-5a59-4dfb-91e6-4322ead41da2.jpg');
INSERT INTO images (landmark_id,image_url) VALUES ('17','https://files.tripstodiscover.com/files/2018/06/1801241_10152201234469089_627537562_o.jpg');
INSERT INTO images (landmark_id,image_url) VALUES ('17','https://s3-media0.fl.yelpcdn.com/bphoto/YoSR6r92TE7-VybQOdLjHw/o.jpg');
INSERT INTO images (landmark_id,image_url) VALUES ('17','https://www.virtualtourgroup.com/wp-content/uploads/2013/07/uncommon.jpg');
INSERT INTO images (landmark_id,image_url) VALUES ('18','https://www.kuhdoosoap.com/wp-content/uploads/2014/11/A-Town.jpg');
INSERT INTO images (landmark_id,image_url) VALUES ('18','https://media.timeout.com/images/103909736/image.jpg');
INSERT INTO images (landmark_id,image_url) VALUES ('18','https://cdn.shopify.com/s/files/1/0095/9954/9503/files/17457426_1380949441964841_8544635245324873263_n_480x480.jpg?v=1561157536');
INSERT INTO images (landmark_id,image_url) VALUES ('19','https://a0.muscache.com/pictures/2b2207c1-ce3f-43c9-be47-ab6c69b992de.jpg');
INSERT INTO images (landmark_id,image_url) VALUES ('19','https://assets.simpleviewinc.com/simpleview/image/fetch/c_limit,q_75,w_1200/https://assets.simpleviewinc.com/simpleview/image/upload/crm/austin/Austin-Featured-Business-Listing_2b8c822c-d3c0-4f5b-39a37eac54fc951d.jpg');
INSERT INTO images (landmark_id,image_url) VALUES ('19','https://assets.simpleviewinc.com/simpleview/image/upload/c_limit,h_1200,q_75,w_1200/v1/clients/austin/Allens_Boots_Courtesy_Contiki__4c41c8fd-3fde-44f0-a60a-a3a9fc0d4dd2.jpg');
INSERT INTO images (landmark_id,image_url) VALUES ('20','https://s7d2.scene7.com/is/image/TWCNews/110219_spec_waterloo_records_record');
INSERT INTO images (landmark_id,image_url) VALUES ('20','https://media.timeout.com/images/103338035/630/472/image.jpg');
INSERT INTO images (landmark_id,image_url) VALUES ('20','https://i.pinimg.com/originals/99/b8/97/99b897083fcaeaac53ad322fffff31e1.jpg');
INSERT INTO images (landmark_id,image_url) VALUES ('21','https://bloximages.newyork1.vip.townnews.com/kdhnews.com/content/tncms/assets/v3/editorial/3/b3/3b3595c2-a011-11e8-bd1a-7b6f75e695d6/5b7357524cd25.image.jpg?resize=1200%2C857');
INSERT INTO images (landmark_id,image_url) VALUES ('21','https://bco.memberize.net/clubportal/images/clubimages/3/EventDisplay/ErikK/Inner-Space-Cavern-3.jpg');
INSERT INTO images (landmark_id,image_url) VALUES ('21','https://www.videocityguide.com/austin/PCWUploads/Inner%20Space%20Cavern%20Tours/gallery7.jpg');
INSERT INTO images (landmark_id,image_url) VALUES ('22','https://communityimpact.com/uploads/images/2020/05/11/56354.jpg');
INSERT INTO images (landmark_id,image_url) VALUES ('22','https://d2u8towkwolubl.cloudfront.net/wp-content/uploads/2019/08/IMG_4704_1-scaled.jpg');
INSERT INTO images (landmark_id,image_url) VALUES ('22','https://cboimages.com/ClickBidImages/3961/19_3_e0pms2aq5c.jpg');
INSERT INTO images (landmark_id,image_url) VALUES ('23','https://www.nowplayingaustin.com/wp-content/uploads/sites/www.nowplayingaustin.com/images/2018/09/organization-featured-K--Angel-Horne-1537805752.jpeg');
INSERT INTO images (landmark_id,image_url) VALUES ('23','https://www.itl.cat/pngfile/big/89-897299_joomla-images-lady-bird-johnson-wildflower-park-family.jpg');
INSERT INTO images (landmark_id,image_url) VALUES ('23','https://thumbs-prod.si-cdn.com/LKHUmALiVt5IyZy6SWFQFSr6Nd4=/720x420/https://public-media.si-cdn.com/museums/15419854755_ddbfe34f3c_k.jpg');
INSERT INTO images (landmark_id,image_url) VALUES ('24','https://thinkeryaustin.org/wp-content/uploads/7-1.jpg');
INSERT INTO images (landmark_id,image_url) VALUES ('24','https://www.beckgroup.com/wp-content/uploads/2014/09/AE_Thinkery_Int_05.jpg');
INSERT INTO images (landmark_id,image_url) VALUES ('24','https://bearandcakes.com/wp-content/uploads/2019/01/the-thinkery-austin-4116-1024x683.jpg');
INSERT INTO images (landmark_id,image_url) VALUES ('25','https://static1.squarespace.com/static/50209fa5c4aa93c656d9ff94/t/5238a84ee4b0cf2e69afaad5/1379444831556/okinawa-aquarium-photograph.jpg?format=1500w');
INSERT INTO images (landmark_id,image_url) VALUES ('25','https://thehomestead.guru/wp-content/uploads/2017/09/2016-11-03-18.49.45.jpg');
INSERT INTO images (landmark_id,image_url) VALUES ('25','https://i2.wp.com/havingfuninthetexassun.com/wp-content/uploads/2016/01/cimg0039.jpg?fit=3456%2C2592&ssl=1');

/*******************
***BUSINESS HOURS***
********************/

INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('1','1','5:00','22:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('1','2','5:00','22:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('1','3','5:00','22:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('1','4','5:00','22:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('1','5','5:00','22:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('1','6','5:00','22:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('1','7','5:00','22:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('2','1','5:00','22:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('2','2','5:00','22:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('2','3','5:00','22:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('2','4','5:00','22:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('2','5','5:00','22:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('2','6','5:00','22:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('2','7','5:00','22:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('3','1','8:00','22:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('3','2','8:00','22:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('3','3','8:00','22:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('3','4','8:00','22:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('3','5','8:00','22:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('3','6','8:00','22:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('3','7','8:00','22:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('4','1','5:00','0:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('4','2','5:00','0:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('4','3','5:00','0:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('4','4','5:00','0:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('4','5','5:00','0:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('4','6','5:00','0:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('4','7','5:00','0:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('5','1','9:00','18:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('5','2','9:00','18:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('5','3','9:00','18:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('5','4','9:00','18:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('5','5','9:00','18:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('5','6','9:00','18:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('5','7','9:00','18:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('6','1','7:00','22:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('6','2','7:00','22:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('6','3','7:00','22:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('6','4','7:00','22:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('6','5','7:00','22:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('6','6','9:00','20:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('6','7','9:00','20:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('7','1', NULL, NULL);
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('7','2', NULL, NULL);
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('7','3','10:00','17:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('7','4','10:00','17:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('7','5','10:00','17:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('7','6','10:00','17:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('7','7','10:00','17:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('8','1', NULL, NULL);
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('8','2', NULL, NULL);
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('8','3','10:00','17:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('8','4','10:00','17:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('8','5','10:00','17:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('8','6','10:00','17:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('8','7','14:00','17:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('9','1','9:00','17:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('9','2','9:00','17:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('9','3','9:00','17:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('9','4','9:00','17:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('9','5','9:00','17:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('9','6','9:00','17:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('9','7','9:00','17:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('10','1','10:00','19:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('10','2','10:00','19:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('10','3','10:00','19:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('10','4','10:00','19:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('10','5','10:00','19:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('10','6','10:00','19:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('10','7','10:00','19:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('11','1', NULL, NULL);
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('11','2','10:30','14:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('11','3','10:30','14:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('11','4','10:30','14:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('11','5','10:30','14:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('11','6','10:30','14:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('11','7','10:30','14:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('12','1','15:00','21:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('12','2','15:00','21:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('12','3','15:00','21:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('12','4','15:00','21:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('12','5','15:00','22:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('12','6','11:00','22:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('12','7','11:00','21:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('13','1', NULL, NULL);
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('13','2','11:00','20:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('13','3','11:00','20:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('13','4','11:00','20:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('13','5','11:00','21:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('13','6','11:00','21:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('13','7','11:00','20:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('14','1','16:00','20:30');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('14','2','16:00','20:30');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('14','3','16:00','20:30');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('14','4','16:00','20:30');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('14','5','16:00','20:30');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('14','6','16:00','20:30');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('14','7','16:00','20:30');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('15','1','11:00','21:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('15','2','11:00','21:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('15','3','11:00','21:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('15','4','11:00','21:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('15','5','11:00','21:30');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('15','6','11:00','21:30');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('15','7','11:00','21:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('16','1','10:00','22:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('16','2','10:00','22:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('16','3','10:00','22:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('16','4','10:00','22:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('16','5','10:00','22:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('16','6','10:00','22:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('16','7','12:00','18:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('17','1','10:00','17:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('17','2','10:00','17:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('17','3','10:00','17:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('17','4','10:00','17:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('17','5','10:00','17:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('17','6','10:00','17:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('17','7','10:00','17:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('18','1','10:00','20:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('18','2','10:00','20:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('18','3','10:00','20:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('18','4','10:00','20:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('18','5','10:00','20:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('18','6','10:00','20:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('18','7','10:00','18:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('19','1','9:00','20:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('19','2','9:00','20:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('19','3','9:00','20:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('19','4','9:00','20:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('19','5','9:00','20:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('19','6','9:00','20:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('19','7','12:00','18:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('20','1','11:00','19:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('20','2','11:00','19:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('20','3','11:00','19:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('20','4','11:00','19:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('20','5','11:00','19:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('20','6','11:00','19:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('20','7','11:00','19:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('21','1','9:00','16:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('21','2','9:00','16:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('21','3','9:00','16:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('21','4','9:00','16:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('21','5','9:00','16:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('21','6','10:00','17:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('21','7','10:00','17:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('22','1','9:30','18:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('22','2','9:30','18:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('22','3','9:30','18:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('22','4','9:30','18:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('22','5','9:30','18:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('22','6','9:30','18:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('22','7','9:30','18:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('23','1','9:00','17:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('23','2','9:00','17:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('23','3','9:00','17:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('23','4','9:00','17:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('23','5','9:00','17:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('23','6','9:00','17:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('23','7','9:00','17:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('24','1', NULL, NULL);
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('24','2', NULL, NULL);
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('24','3', NULL, NULL);
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('24','4', NULL, NULL);
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('24','5','9:15','15:15');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('24','6','9:15','15:15');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('24','7','9:15','15:15');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('25','1','10:00','19:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('25','2','10:00','19:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('25','3','10:00','19:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('25','4','10:00','19:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('25','5','10:00','20:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('25','6','10:00','20:00');
INSERT INTO business_hours (landmark_id,day_of,open_time,close_time) VALUES ('25','7','10:00','19:00');