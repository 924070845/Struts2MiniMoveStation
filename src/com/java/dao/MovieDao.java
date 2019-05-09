package com.java.dao;

import com.java.conn.Conn;
import com.java.entity.Movie;
import com.opensymphony.xwork2.ActionContext;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class MovieDao implements IBaseDao<Movie> {

    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式

    public List<Movie> selectMovieID(Movie movie){
        List<Movie> movieList = new ArrayList<Movie>();
        ResultSet rs = null;

        try{
            Conn conn = new Conn();
            Connection dbc = conn.getConn();
            String sql_selectId = "SELECT * FROM movie , label WHERE movie.label_id = label.id AND movie.id = ?";
            PreparedStatement pst = dbc.prepareStatement(sql_selectId);
            pst.setInt(1, movie.getMovieID());
            rs = pst.executeQuery();
            while (rs.next()){
                movie.setTitle(rs.getString("title"));
                movie.setInfo(rs.getString("info"));
                movie.setLogo(rs.getString("logo"));
                movie.setStar(rs.getString("star"));
                movie.setLabel_id(rs.getInt("label_id"));
                movie.setLabelName(rs.getString("label.name"));
                movie.setArea(rs.getString("area"));
                movie.setPlayTime(rs.getString("playtime"));
                movie.setReleaseDate(rs.getString("releasedate"));
                movieList.add(movie);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        ActionContext.getContext().getSession().put("movieList", movieList);
        ActionContext.getContext().getSession().put("movie_id", movie.getMovieID());
        return movieList;

    }

    // 查到电影名
    public List<Movie> getTitleMovie(String title){

        List<Movie> movieList = new ArrayList<Movie>();
        ResultSet rs = null;

        try{
            //连上数据库的语句
            Conn conn = new Conn();
            Connection bdc = conn.getConn();

            String sql_select = " SELECT * from movie where title like ? ";

            PreparedStatement pst = bdc.prepareStatement(sql_select);
            pst.setString(1,"%"+title+"%");
            rs = pst.executeQuery();//查询专用语句,这样的话，就可以用数据库的原生函数，如.next()
            System.out.println("SQL语句为："+pst);
            while (rs.next()){
                Movie movie = new Movie();
                movie.setMovieID(rs.getInt("id"));
                System.out.println("数据库刚刚取出的电影id是："+movie.getMovieID());
                movie.setTitle(rs.getString("title"));
                movie.setLogo(rs.getString("logo"));
                movie.setInfo(rs.getString("info"));
                movieList.add(movie);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return movieList;
    }

    // 添加电影
    @Override
    public int insertOne(Movie movie) {
        int rs = 0;
        Conn conn = new Conn();
        Connection dbc = conn.getConn();
        PreparedStatement pst = null;

        try {
            String sql_insert = "INSERT INTO `movie` (title, info, star, logo, label_id, area, playtime, addtime, releasedate) VALUES(?,?,?,?,?,?,?,?,?)";
            pst = dbc.prepareStatement(sql_insert);
            pst.setString(1, movie.getTitle());
            pst.setString(2, movie.getInfo());
            pst.setString(3, movie.getStar());
            pst.setString(4, movie.getLogo());
            pst.setInt(5, movie.getLabel_id());
            pst.setString(6, movie.getArea());
            pst.setString(7, movie.getPlayTime());    // 影片时长
            pst.setString(8, df.format(new Date()));  // 添加当前时间
            pst.setString(9, movie.getReleaseDate()); // 上映时间
            rs = pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }

    // 删除一条电影记录
    @Override
    public int deleteOne(Integer movieID) {
        int rs = 0;
        try {
            Conn dbc = new Conn();
            Connection conn = dbc.getConn();
            String sql_delect = "DELETE  FROM movie WHERE id = ?";
            PreparedStatement pst = conn.prepareStatement(sql_delect);
            pst.setInt(1, movieID);
            rs = pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }

    // 修改电影
    @Override
    public Movie updateOne(Movie movie) {
        try {
            Conn dbc = new Conn();
            Connection conn = dbc.getConn();
            String sql_update = "update movie set" +
                    " info=?, star=?, logo=?, label_id=?, area=?, playtime=?, releasedate=?" +
                    " where title=?";
            PreparedStatement pst = conn.prepareStatement(sql_update);
            pst.setString(1, movie.getInfo());
            pst.setString(2, movie.getStar());
            pst.setString(3, movie.getLogo());
            pst.setInt(4, movie.getLabel_id());
            pst.setString(5, movie.getArea());
            pst.setString(6, movie.getPlayTime());
            pst.setString(7, movie.getReleaseDate());
            pst.setString(8, movie.getTitle());
            pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return movie;
    }

    // 查找所有的电影
    @Override
    public List<Movie> selectAll() {
        List<Movie> movieList  = new ArrayList<Movie>();
        ResultSet rs = null;

        try {
            Conn conn = new Conn();
            Connection dbc = conn.getConn();
            String sql_select = "SELECT * FROM movie , label WHERE movie.label_id = label.id";
            PreparedStatement pst = dbc.prepareStatement(sql_select);
            rs = pst.executeQuery();
            while (rs.next()) {
                Movie movie = new Movie();
                movie.setMovieID(rs.getInt("id"));
                movie.setTitle(rs.getString("title"));
                movie.setPlayTime(rs.getString("playtime"));
                movie.setInfo(rs.getString("info"));
                movie.setStar(rs.getString("star"));
                movie.setLogo(rs.getString("logo"));
                movie.setLabelName(rs.getString("label.name"));
                movie.setArea(rs.getString("area"));
                movie.setReleaseDate(rs.getString("releasedate"));
                movie.setAddtime(rs.getString("addtime"));
                movieList.add(movie);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        ActionContext.getContext().getSession().put("movieList", movieList);
        return movieList;
    }

    // 按ID号找到对应的电影
    @Override
    public List<Movie> selectByID(Integer id) {
        return null;
    }
}
