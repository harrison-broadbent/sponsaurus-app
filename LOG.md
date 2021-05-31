### Decision / TODO Log

#### 31-May-2021

> Added ability for users to sign in and out, started scoping out models
- Fixed a routing thing where where devise wouldn't log me in/out properly
    - because I had User above devise_for :user in the routes file, some routes were not matching properly
- Started modelling User->Newsletters->Slots relationship
    - generated scaffolds for them and just working on the model
    
- i'm thinking that eventually i'll need/want to break out the slots model into - 
    - slots,
    - advertiser,
    - form
    
so that I can better model the problem better, also that would enable things like recognizing repeat advertisers, 
more customization over forms etc. I think I can save that for post mvp though. 

> NEXT TIME: finish and migrate user models, and then start linking them together (creating newsletters. slots etc)