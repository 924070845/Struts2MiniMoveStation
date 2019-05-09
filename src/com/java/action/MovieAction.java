package com.java.action;

import com.java.dao.MovieDao;
import com.java.entity.Movie;
import com.java.entity.MovieCover;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.struts2.ServletActionContext;

import javax.swing.text.html.HTMLDocument;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class MovieAction  extends ActionSupport implements ModelDriven {
    public Movie movie = new Movie();
    List<Movie> movieList;
    private int id;

    // 用于校验
    private static Pattern p = null;
    private static Matcher m = null;
    private static boolean flg;

    // 上传电影封面
    private File cover;
    private String coverFileName;
    private String coverContentType;
    private String savePath;
    private String realname;
    private String path;
    private String target;

    // 添加电影
    public String insertMovie() throws IOException {
        // 上传电影封面
        if (cover != null) {
            //文件上传
            //观察封装文件信息的三个参数
            System.out.println("前台拿到的logo是："+cover);
            System.out.println(coverFileName);
            System.out.println(coverContentType);
            //文件上传
            @SuppressWarnings("resource")
            FileInputStream fis = new FileInputStream(cover);
            realname = UUID.randomUUID() + coverFileName;
            System.out.println("realname=" + realname);
            target = ServletActionContext.getServletContext().getRealPath(savePath);
            System.out.println("1保存流路劲为"+target+"\\"+realname);
            @SuppressWarnings("resource")
            FileOutputStream fos = new FileOutputStream(target + "\\" + realname);
            byte[] buf = new byte[1024];
            int len = 0;
            while ((len = fis.read(buf)) > 0) {
                fos.write(buf, 0, len);
            }
            //在这里setLogo之后，下面切记不能再set了，在set就重置了
            movie.setLogo(realname);
        }
        // 添加到数据库
        MovieDao movieDao = new MovieDao();
        int rs = movieDao.insertOne(movie);
        if (rs != 0) {
            ActionContext.getContext().getSession().put("title", movie.getTitle());
            System.out.println("电影信息插入成功InsertSuccess!!");
            return "insertMovieSUCCESS";
        } else {
            ActionContext.getContext().getSession().put("message", "InsertError!!");
            System.out.println("电影信息插入失败ERROR");
            return "insertMovieERROR";
        }
    }

    // 查找所有的电影
    public String selectAllMovie(){
        MovieDao movieDao = new MovieDao();
        movieList = movieDao.selectAll();
        ActionContext.getContext().getSession().put("movieList",movieList);
        return "selectAllMovieSUCCESS";
    }

    // 删除一条电影记录
    public String deleteMovie(){
        try {
            MovieDao movieDao = new MovieDao();
            movieDao.deleteOne(id);
            addActionMessage(" ✔ 删除成功");
            return "deleteMovieSUCCESS";
        } catch (Exception e) {
            e.printStackTrace();
            return "deleteMovieERROR";
        }
    }

    // 按得到的编号找到电影
    public String selectIDMovie(){
        MovieDao movieDao = new MovieDao();
        movie.setMovieID(id);
        System.out.println("点击电影传回的电影编号"+id);
        movieList = movieDao.selectMovieID(movie);
        return "selectIDMovieSUCCESS";
    }

    // 修改电影信息
    public String updateMovie() throws IOException {

        System.out.println("前台拿到的logo是："+cover);
        System.out.println(coverFileName);
        System.out.println(coverContentType);

        // 上传电影封面
        if (cover != null) {
            //文件上传
            //观察封装文件信息的三个参数
            System.out.println("前台拿到的logo是："+cover);
            System.out.println(coverFileName);
            System.out.println(coverContentType);
            //文件上传
            @SuppressWarnings("resource")
            FileInputStream fis = new FileInputStream(cover);
            realname = UUID.randomUUID() + coverFileName;
            System.out.println("realname=" + realname);
            target = ServletActionContext.getServletContext().getRealPath(savePath);
            System.out.println("1保存流路劲为"+target+"\\"+realname);
            @SuppressWarnings("resource")
            FileOutputStream fos = new FileOutputStream(target + "\\" + realname);
            byte[] buf = new byte[1024];
            int len = 0;
            while ((len = fis.read(buf)) > 0) {
                fos.write(buf, 0, len);
            }
            //在这里setLogo之后，下面切记不能再set了，在set就重置了
            movie.setLogo(realname);
        }


        MovieDao movieDao = new MovieDao();
        movie.setTitle(movie.getTitle());
        movie.setInfo(movie.getInfo());
        movie.setStar(movie.getStar());
        movie.setArea(movie.getArea());
        movie.setLabel_id(movie.getLabel_id());
        movie.setReleaseDate(movie.getReleaseDate());
        movie.setPlayTime(movie.getPlayTime());
        movieDao.updateOne(movie);
        return "updateMovieSUCCESS";
    }

    // 在电影首页展示电影的函数
    public String showAllMovie(){
        MovieDao movieDao = new MovieDao();
        List<Movie> movieList = movieDao.selectAll();
        Iterator it = movieList.iterator();
        if (it.hasNext()){
            movie = (Movie) it.next();
            System.out.println("数据库中的封面信息为："+movie.getLogo());
            path = movie.getLogo();
            System.out.println("path:"+path);
            ActionContext.getContext().getSession().put("logoPath",path);
        }
        return "showAllMovieSUCCESS";
    }

    // 导航栏搜索电影
    public String getTitleMovie(){
        MovieDao movieDao = new MovieDao();
        movie.setTitle(movie.getTitle());
        movieList = movieDao.getTitleMovie(movie.getTitle());
        ActionContext.getContext().getSession().put("movieList",movieList);
        return "getTitleMovieSUCCESS";
    }

    // 手动校验规则开始*############################################################################################################

    // 检验添加电影页面的输入框是否为空以及各自是否符合规范
    public void validateInsertMovie() {
        System.out.println("进入了 validateInsertMovie 方法进行写入校验");
        if (movie.getTitle() == null || "".equals(movie.getTitle()))
            addFieldError("titleNULL", "电影名不能为空");
        else{
            /**电影名：最长15位*/
            p = Pattern.compile("^.{0,15}$");

            m = p.matcher(movie.getTitle());
            flg = m.matches();
            if (!flg) addFieldError("titleERROR","电影名：最长15位");
        }

        if (movie.getInfo() == null || "".equals(movie.getInfo()))
            addFieldError("infoNULL","电影介绍不能为空");

//        if (movie.getCover() == null || "".equals(movie.getCover()))
//            addFieldError("logoNULL","电影封面不能为空");

        if (movie.getArea() == null || "".equals(movie.getArea()) )
            addFieldError("areaNULL","电影地区不能为空");
        else{
            /**电影地区：由汉字组成，1~10位*/
            p = Pattern.compile("^[\\u4e00-\\u9fa5]{1,10}");
            m = p.matcher(movie.getArea());
            flg = m.matches();
            if (!flg) addFieldError("areaERROR","电影地区由汉字组成，1~10位");
        }

        if (movie.getReleaseDate() == null || "".equals(movie.getReleaseDate()))
            addFieldError("playTimeNULL","电影片长不能为空");
        else{
            /**电影时长：填入的是分钟数*/
            p = Pattern.compile("^[0-9]{3}\\u5206\\u949f");
            m = p.matcher(movie.getPlayTime());
            flg = m.matches();
            if (!flg) addFieldError("playTimeERROR","电影时长：填入的是分钟数：xxx分钟");
        }

    }

    // 检查修改电影信息时输入框是否为空以及是否符合规定
    public void validateUpdateMovie() {
        System.out.println("进入了 validateInsertMovie 方法进行写入校验");
        if (movie.getTitle() == null || "".equals(movie.getTitle()))
            addFieldError("titleNULL", "电影名不能为空");
        else{
            /**电影名：最长15位*/
            p = Pattern.compile("^.{0,15}$");

            m = p.matcher(movie.getTitle());
            flg = m.matches();
            if (!flg) addFieldError("titleERROR","电影名：最长15位");
        }

        if (movie.getInfo() == null || "".equals(movie.getInfo()))
            addFieldError("infoNULL","电影介绍不能为空");

//        if (movie.getLogo() == null || "".equals(movie.getLogo()))
//            addFieldError("logoNULL","电影封面不能为空");

        if (movie.getArea() == null || "".equals(movie.getArea()) )
            addFieldError("areaNULL","电影地区不能为空");
        else{
            /**电影地区：由汉字组成，1~10位*/
            p = Pattern.compile("^[\\u4e00-\\u9fa5]{1,10}");
            m = p.matcher(movie.getArea());
            flg = m.matches();
            if (!flg) addFieldError("areaERROR","电影地区由汉字组成，1~10位");
        }

        if (movie.getReleaseDate() == null || "".equals(movie.getReleaseDate()))
            addFieldError("playTimeNULL","电影片长不能为空");
        else{
            /**电影时长：填入的是分钟数*/
            p = Pattern.compile("^[0-9]{3}\\u5206\\u949f");
            m = p.matcher(movie.getPlayTime());
            flg = m.matches();
            if (!flg) addFieldError("playTimeERROR","电影时长：填入的是分钟数：xxx分钟");
        }

    }

    // 检查搜索框是否为空
    public void validateGetTitleMovie(){
        System.out.println("进入了 validateGetTitleMovie 方法进行写入校验");
        if (movie.getTitle() == null || "".equals(movie.getTitle()))
            addFieldError("titleNULL", "电影名不能为空");
    }

    @Override
    public Object getModel() {
        return movie;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public File getCover() {
        return cover;
    }

    public void setCover(File cover) {
        this.cover = cover;
    }

    public String getCoverFileName() {
        return coverFileName;
    }

    public void setCoverFileName(String coverFileName) {
        this.coverFileName = coverFileName;
    }

    public String getCoverContentType() {
        return coverContentType;
    }

    public void setCoverContentType(String coverContentType) {
        this.coverContentType = coverContentType;
    }

    public String getSavePath() {
        return savePath;
    }

    public void setSavePath(String savePath) {
        this.savePath = savePath;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getTarget() {
        return target;
    }

    public void setTarget(String target) {
        this.target = target;
    }
}
