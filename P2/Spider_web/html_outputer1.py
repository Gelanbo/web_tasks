# -*- coding: utf-8 -*-
class HtmlOutputer(object):
    def __init__(self):
        self.datas = []
    
    def collect_data(self,data):
        if data is None:
            return
        for key in data:
            self.datas.append(key)
    
    def output_html(self):
        fout = open('output.html','w')       
        fout.write("<html>")
        fout.write("<body>")
        fout.write("<table>")             
        
        for data in self.datas:
            fout.write("<tr>")
            for dat in data:
                fout.write("<td>%s</td>" % dat.encode('utf-8'))
            fout.write("</tr>")
        
        fout.write("</table>")
        fout.write("</body>")
        fout.write("</html>")
            
        fout.close()