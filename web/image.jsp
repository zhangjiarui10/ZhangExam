<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 2020/7/9
  Time: 18:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="image/JPEG" import="java.awt.*,java.awt.image.*,java.util.*,javax.imageio.*"
         pageEncoding="GBK"%>
<%!Color getRandColor(int fc, int bc) {//������Χ��������ɫ
    Random random = new Random();
    if (fc > 255)
        fc = 255;
    if (bc > 255)
        bc = 255;
    int r = fc + random.nextInt(bc - fc);
    int g = fc + random.nextInt(bc - fc);
    int b = fc + random.nextInt(bc - fc);
    return new Color(r, g, b);
}%>
<%
    //����ҳ�治����
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);
    // ���ڴ��д���ͼ��
    int width = 60, height = 20;
    BufferedImage image = new BufferedImage(width, height,BufferedImage.TYPE_INT_RGB);
    // ��ȡͼ��������
    Graphics g = image.getGraphics();
    //���������
    Random random = new Random();
    // �趨����ɫ
    g.setColor(getRandColor(200, 250));
    g.fillRect(0, 0, width, height);
    //�趨����
    g.setFont(new Font("Times New Roman", Font.PLAIN, 18));
    //���߿�
    //g.setColor(new Color());
    //g.drawRect(0,0,width-1,height-1);
    // �������155�������ߣ�ʹͼ���е���֤�벻�ױ���������̽�⵽
    g.setColor(getRandColor(160, 200));
    for (int i = 0; i < 100; i++) {
        int x = random.nextInt(width);
        int y = random.nextInt(height);
        int xl = random.nextInt(12);
        int yl = random.nextInt(12);
        g.drawLine(x, y, x + xl, y + yl);
    }
    // �õ������������֤��(4λ����)
    String a="";
    String rand = request.getParameter("rand");
    //System.out.println(rand);
    for (int i = 0; i < 4; i++) {
        //ImageIO.write(image, "JPEG", response.getOutputStream());
        a = rand.substring(i, i + 1);
        // ����֤����ʾ��ͼ����
        g.setColor(new Color(20 + random.nextInt(110),
                20 + random.nextInt(110), 20 + random.nextInt(110)));//���ú�����������ɫ��ͬ����������Ϊ����̫�ӽ�������ֻ��ֱ������
        g.drawString(a, 13 * i + 6, 16);
    }
    // ͼ����Ч
    System.out.println("--------------------");
    System.out.println(g);
    System.out.println("--------------------");
    g.dispose();
    // ���ͼ��ҳ��
    ImageIO.write(image, "JPEG", response.getOutputStream());

    out.clear();
    out=pageContext.pushBody();
//���������䣬tomcat��û���쳣��Ϣ
%>