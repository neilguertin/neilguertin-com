Website for [neilguertin.com](https://www.neilguertin.com)

This website is built using [Jekyll](https://jekyllrb.com/) and hosted on [GitHub Pages](https://pages.github.com/).

### Building
```
git clone https://github.com/neilguertin/neilguertin-com
cd neilguertin-com
sudo apt install ruby-full gcc g++ make
gem install jekyll bundler
bundler install
bundler exec jekyll serve --livereload --baseurl="" --drafts
```
The website should now be live at http://localhost:4000/
