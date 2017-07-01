# -*- coding: utf-8 -*-
from bs4 import BeautifulSoup

class HtmlParser(object):
    def _get_new_data(self, main_url, soup):
        
        #<div class="title">
        question_node = soup.find_all('div',class_="title")
        #<div class="summary hidden-expanded" style="">
        summary_node = soup.find_all('div', class_="summary hidden-expanded")

        return question_node,summary_node

    
    def parse(self,main_url,html_cont):

        if html_cont is None:
            return
        print html_cont
        soup = BeautifulSoup(html_cont,'html.parser')
        new_data = self._get_new_data(main_url,soup)
        return new_data