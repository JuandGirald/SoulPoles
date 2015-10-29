SoulPoles Website
============

**Maintainers** 
* Juan David Giraldo (primary) jdgiraldo88@hotmail.com

Staging server: http://soulpoles.herokuapp.com/

Description
============

SoulPoles site built with ruby on rails and the SpreeCommerce platform 

Local Setup
============

Install Imagemagick
<pre><code>brew install imagemagick</code></pre>

Install All dependencies 
<pre><code>bundle install</code></pre>

Run Migrations
<pre><code>rake db:migrate</code></pre>

If you want to run the seeds, then run: 

    bundle exec rake db:seed
    bundle exec rake spree_sample:load

Now you can run the app in your localhost!
