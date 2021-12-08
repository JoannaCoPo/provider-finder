# Provider Finder
### A provider lookup tool for those seeking providers that accept Medicare and Medicaid.
##### Created using Medicare & Medicaid's NPI (National Provider Identifier) [API](https://npiregistry.cms.hhs.gov/registry/help-api).
* Visit [this link](https://medicaid-provider-lookup.herokuapp.com/provider_search) for the deployed app in production

App requirements include but are not limited to:
* The backend API calls serving the UI need to accept searches by:
  * Last Name + 2 character state abbrevation
  * First Name + Last Name
  * Exact provider specialty + 2 character state abbrevation
* The interface should take the doctor's name and the state as inputs.
* On fetched results, the UI should display the provider’s full name, NPI number, and a list
of addresses for each result.
* Include pagination (optional)
* 
#### Framework
<p>
  <img src="https://img.shields.io/badge/Ruby%20On%20Rails-b81818.svg?&style=flat&logo=rubyonrails&logoColor=white" />
</p>

#### Languages
<p>
  <img src="https://img.shields.io/badge/Ruby-CC0000.svg?&style=flaste&logo=ruby&logoColor=white" />
  <img src="https://img.shields.io/badge/HTML5-0EB201.svg?&style=flaste&logo=html5&logoColor=white" />
  <img src="https://img.shields.io/badge/CSS3-1572B6.svg?&style=flaste&logo=css3&logoColor=white" />
</p>

#### Testing
<p>
<img src="https://img.shields.io/badge/rspec-16B7FB.svg?&style=flaste&logo=rubygems&logoColor=white" />
</p>

#### Tools
<p>  
  <img src="https://img.shields.io/badge/Git-F05032.svg?&style=flaste&logo=git&logoColor=white" />
  <img src="https://img.shields.io/badge/GitHub-181717.svg?&style=flaste&logo=github&logoColor=white" />
  <img src="https://img.shields.io/badge/Postman-FF6E4F.svg?&style=flat&logo=postman&logoColor=white" />
  <img src="https://img.shields.io/badge/Bootstrap-563D7C?style=flaste&logo&logo=bootstrap&logoColor=white" />
  <img src="https://img.shields.io/badge/Heroku-430098.svg?&style=flaste&logo=heroku&logoColor=white" />
</p>

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)


#### <ins>Project Configurations</ins>

* Ruby Version
    ```bash
    $ ruby -v
    ruby 2.7.2p137 (2020-10-01 revision 5445e04352) [x86_64-darwin20]
    ```

* See system depenencies [here](https://github.com/JoannaCoPo/provider-finder/blob/main/Gemfile)
    ```bash
    $ rails -v
    Rails 6.1.4
    ```
    
* How to run the test suite:
    ```bash
    $ bundle exec rspec -fd
    ```


