# -*- coding: utf-8 -*-
from zhihu_web import html_downloader1,html_parser1,html_outputer1

class SpiderMain(object):
    def __init__(self):
        self.downloader = html_downloader1.HtmlDownloader()
        self.parser = html_parser1.HtmlParser()
        self.outputer = html_outputer1.HtmlOutputer()
        
    def craw(self,main_url):
        html_cont = self.downloader.download(main_url)
        data = self.parser.parse(main_url,html_cont)
        self.outputer.collect_data(data)        
        self.outputer.output_html()        
    
if __name__=="__main__":
    main_url = "https://www.zhihu.com/search?type=content&q=web"
    obj_spider = SpiderMain()
    obj_spider.craw(main_url)