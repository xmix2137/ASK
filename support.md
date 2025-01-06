# Install Java ecpmmerce

## Requirements
 
 # VPS - access
    * public ip ''3.72.79.27''
    * user name  ''ec2-user''
    * private key 
        ''curl -O http://adsk.dydaktyka.jkan.pl/_static/id_student''
        ''chmod 600''
    * ''ssh username@ip - i private_key ''
     * ''ssh ec2-user@3.72.79.27 -i id_student''

    * github repo
        * github '' https://github.com/jkanclerz/computer-programming-4-2024 ''


## TODOs
    * upgrade system dependecy
        * ''sudo dnf update && sudo dnf upgrade''
    * search for packages
        * ''dnf search {query}''
        * ''dnf search git''
    * install package
        * ''sudo install git''
    * Sync repo
        *''git clone {repo} ''

    * install java env
        * install java JRE
            * '' install java JRE java-17-amazon-corretto ''
            * '' sudo dnf install java-17-amazon-corretto ''
        * install maven
            * donwload maven binary ''wget https://dlcdn.apache.org/maven/maven-3/3.9.9/binaries/apache-maven-3.9.9-bin.tar.gz''
        * unpack maven
            * ''tar -xvzf {file}''
        * link to PATH aware dir
         * '' sudo ln -s /home/ec2-user/apache-maven-3.9.9/bin/mvn /usr/bin/mvn ''

    * Compile & test &run
        * ''mvn compile''
        * ''mvn test''
        * ''mvn package -DskipTests''

    * Start 
        * ''java -Dserver.port=8080 -jar target/CreditCard-1.0-SNAPSHOT.jar''

## Final Output
    * open ''http://(public ip) : 80 ''
    * asser myEcommerceIsAvailable()