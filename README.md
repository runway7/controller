# Controller

Control your AWS application and environment setup, deployment and management right from your command line. Controller is a higher level abstraction over the AWS API that assists you in designing and building a web server deployment that is cost effective and scales effortlessly. 

Controller is also completely decentralized. It does not use any kind of datastore or cache, so you can control the same application from a development box and a build server simultaneously, for example.

## Installation

    gem install 'controller'

Although written in Ruby, Controller is completely language agnostic and can be used to set up and manage environments for any language. 

## Usage

Controller is built for and works best with a certain kind of deployment - a fleet of web / application servers. It thinks of deployments in terms of applications and environments; that each application has one or more environments (like testing / staging / production). It assumes each environment is made of the following components:

* One public facing load balancer per environment through which all incoming connections are routed - this uses the ELB service.

* One or more `LaunchConfiguration`(s) that control which AMI and UserData combination is on the environment. Only one `LaunchConfiguration` can be active at any time. The AMI holds the codebase, and the UserData typically holds environment specific variables like the database host, keys, etc. 

* One or more Auto Scaling Groups that all have the same LaunchConfiguration. These are sets of servers that grow and shrink according to traffic and demand. It usually makes sense to have one group composed of on-demand instances, and another that works on spot instances. This way, spot instances can soak up the traffic as long as they're cost-effective, at which point they die out and the on demand instances fully take over. 

* One or more database(s) - RDS, ElastiCache (Memcache and/or Redis). These are AWS managed services, but Contoller can make it easy to provision them, take backups, forks, and the like. 

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
