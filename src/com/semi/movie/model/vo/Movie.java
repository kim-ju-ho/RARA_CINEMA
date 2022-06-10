package com.semi.movie.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Movie implements Serializable{

   /**
    * 
    */
   private static final long serialVersionUID = 3721380916294178995L;

   private int movieNo;
   private String movieTitle;
   private Date movieOpen;
   private Date movieClose;
   private String movieGenre;
   private String director;


   private String actor;
   private int ageLimit;
   private int runningTime;
   private String trailerURL;
   private String mphotopath;
   private String poster_path;
   private String movieInfo;
   private int score;
   private int sales;
   private int male;
   private int female;
   
   public Movie() {
      super();
      // TODO Auto-generated constructor stub
   }

   // 영화 등록 생성
   

   
   public Movie(String movieTitle, Date movieOpen, Date movieClose, String movieGenre, String director, String actor,
         int ageLimit, int runningTime, String trailerURL, String mphotopath, String poster_path, String movieInfo) {
      super();
      this.movieTitle = movieTitle;
      this.movieOpen = movieOpen;
      this.movieClose = movieClose;
      this.movieGenre = movieGenre;
      this.director = director;
      this.actor = actor;
      this.ageLimit = ageLimit;
      this.runningTime = runningTime;
      this.trailerURL = trailerURL;
      this.mphotopath = mphotopath;
      this.poster_path = poster_path;
      this.movieInfo = movieInfo;
   }

   
   
   
   
   public Movie(int movieNo, String movieTitle, Date movieOpen, Date movieClose, String movieGenre, String director,
         String actor, int ageLimit, int runningTime, String trailerURL, String mphotopath, String poster_path,
         String movieInfo) {
      super();
      this.movieNo = movieNo;
      this.movieTitle = movieTitle;
      this.movieOpen = movieOpen;
      this.movieClose = movieClose;
      this.movieGenre = movieGenre;
      this.director = director;
      this.actor = actor;
      this.ageLimit = ageLimit;
      this.runningTime = runningTime;
      this.trailerURL = trailerURL;
      this.mphotopath = mphotopath;
      this.poster_path = poster_path;
      this.movieInfo = movieInfo;
   }
   
   
   

   public Movie(int movieNo, String movieTitle, Date movieOpen, Date movieClose, String movieGenre, String director,
         String actor, int ageLimit, int runningTime, String trailerURL, String mphotopath, String poster_path,
         String movieInfo, int score, int sales, int male, int female) {
      super();
      this.movieNo = movieNo;
      this.movieTitle = movieTitle;
      this.movieOpen = movieOpen;
      this.movieClose = movieClose;
      this.movieGenre = movieGenre;
      this.director = director;
      this.actor = actor;
      this.ageLimit = ageLimit;
      this.runningTime = runningTime;
      this.trailerURL = trailerURL;
      this.mphotopath = mphotopath;
      this.poster_path = poster_path;
      this.movieInfo = movieInfo;
      this.score = score;
      this.sales = sales;
      this.male = male;
      this.female = female;
   }
   package com.semi.movie.model.vo;

   import java.io.Serializable;
   import java.sql.Date;

   public class Movie implements Serializable{

   	/**
   	 * 
   	 */
   	private static final long serialVersionUID = 3721380916294178995L;

   	private int movieNo;
   	private String movieTitle;
   	private Date movieOpen;
   	private Date movieClose;
   	private String movieGenre;
   	private String director;


   	private String actor;
   	private int ageLimit;
   	private int runningTime;
   	private String trailerURL;
   	private String mphotopath;
   	private String poster_path;
   	private String movieInfo;
   	private int score;
   	private int sales;
   	private int male;
   	private int female;
   	
   	public Movie() {
   		super();
   		// TODO Auto-generated constructor stub
   	}

   	// 영화 등록 생성
   	

   	
   	public Movie(String movieTitle, Date movieOpen, Date movieClose, String movieGenre, String director, String actor,
   			int ageLimit, int runningTime, String trailerURL, String mphotopath, String poster_path, String movieInfo) {
   		super();
   		this.movieTitle = movieTitle;
   		this.movieOpen = movieOpen;
   		this.movieClose = movieClose;
   		this.movieGenre = movieGenre;
   		this.director = director;
   		this.actor = actor;
   		this.ageLimit = ageLimit;
   		this.runningTime = runningTime;
   		this.trailerURL = trailerURL;
   		this.mphotopath = mphotopath;
   		this.poster_path = poster_path;
   		this.movieInfo = movieInfo;
   	}

   	
   	
   	
   	
   	public Movie(int movieNo, String movieTitle, Date movieOpen, Date movieClose, String movieGenre, String director,
   			String actor, int ageLimit, int runningTime, String trailerURL, String mphotopath, String poster_path,
   			String movieInfo) {
   		super();
   		this.movieNo = movieNo;
   		this.movieTitle = movieTitle;
   		this.movieOpen = movieOpen;
   		this.movieClose = movieClose;
   		this.movieGenre = movieGenre;
   		this.director = director;
   		this.actor = actor;
   		this.ageLimit = ageLimit;
   		this.runningTime = runningTime;
   		this.trailerURL = trailerURL;
   		this.mphotopath = mphotopath;
   		this.poster_path = poster_path;
   		this.movieInfo = movieInfo;
   	}
   	
   	
   	

   	public Movie(int movieNo, String movieTitle, Date movieOpen, Date movieClose, String movieGenre, String director,
   			String actor, int ageLimit, int runningTime, String trailerURL, String mphotopath, String poster_path,
   			String movieInfo, int score, int sales, int male, int female) {
   		super();
   		this.movieNo = movieNo;
   		this.movieTitle = movieTitle;
   		this.movieOpen = movieOpen;
   		this.movieClose = movieClose;
   		this.movieGenre = movieGenre;
   		this.director = director;
   		this.actor = actor;
   		this.ageLimit = ageLimit;
   		this.runningTime = runningTime;
   		this.trailerURL = trailerURL;
   		this.mphotopath = mphotopath;
   		this.poster_path = poster_path;
   		this.movieInfo = movieInfo;
   		this.score = score;
   		this.sales = sales;
   		this.male = male;
   		this.female = female;
   	}

   	public int getScore() {
   		return score;
   	}

   	
   	public void setScore(int score) {
   		this.score = score;
   	}

   	public int getSales() {
   		return sales;
   	}

   	public void setSales(int sales) {
   		this.sales = sales;
   	}

   	public int getMale() {
   		return male;
   	}

   	public void setMale(int male) {
   		this.male = male;
   	}

   	public int getFemale() {
   		return female;
   	}

   	public void setFemale(int female) {
   		this.female = female;
   	}
   	public String getMphotopath() {
   		return mphotopath;
   	}

   	public void setMphotopath(String mphotopath) {
   		this.mphotopath = mphotopath;
   	}

   	public int getMovieNo() {
   		return movieNo;
   	}

   	public void setMovieNo(int movieNo) {
   		this.movieNo = movieNo;
   	}

   	public String getMovieTitle() {
   		return movieTitle;
   	}

   	public void setMovieTitle(String movieTitle) {
   		this.movieTitle = movieTitle;
   	}

   	public Date getMovieOpen() {
   		return movieOpen;
   	}

   	public void setMovieOpen(Date movieOpen) {
   		this.movieOpen = movieOpen;
   	}

   	public Date getMovieClose() {
   		return movieClose;
   	}

   	public void setMovieClose(Date movieClose) {
   		this.movieClose = movieClose;
   	}

   	public String getMovieGenre() {
   		return movieGenre;
   	}

   	public void setMovieGenre(String movieGenre) {
   		this.movieGenre = movieGenre;
   	}

   	public String getDirector() {
   		return director;
   	}

   	public void setDirector(String director) {
   		this.director = director;
   	}

   	public String getActor() {
   		return actor;
   	}

   	public void setActor(String actor) {
   		this.actor = actor;
   	}

   	public int getAgeLimit() {
   		return ageLimit;
   	}

   	public void setAgeLimit(int ageLimit) {
   		this.ageLimit = ageLimit;
   	}

   	public int getRunningTime() {
   		return runningTime;
   	}

   	public void setRunningTime(int runningTime) {
   		this.runningTime = runningTime;
   	}

   	public String getTrailerURL() {
   		return trailerURL;
   	}

   	public void setTrailerURL(String trailerURL) {
   		this.trailerURL = trailerURL;
   	}

   	public String getPoster_path() {
   		return poster_path;
   	}

   	public void setPoster_path(String poster_path) {
   		this.poster_path = poster_path;
   	}

   	public String getMovieInfo() {
   		return movieInfo;
   	}

   	public void setMovieInfo(String movieInfo) {
   		this.movieInfo = movieInfo;
   	}

   	@Override
   	public String toString() {
   		return "Movie [movieNo=" + movieNo + ", movieTitle=" + movieTitle + ", movieOpen=" + movieOpen + ", movieClose="
   				+ movieClose + ", movieGenre=" + movieGenre + ", director=" + director + ", actor=" + actor
   				+ ", ageLimit=" + ageLimit + ", runningTime=" + runningTime + ", trailerURL=" + trailerURL
   				+ ", mphotopath=" + mphotopath + ", poster_path=" + poster_path + ", movieInfo=" + movieInfo
   				+ ", score=" + score + ", sales=" + sales + ", male=" + male + ", female=" + female + "]";
   	}
   	
   	
   }

   public int getScore() {
      return score;
   }

   
   public void setScore(int score) {
      this.score = score;
   }

   public int getSales() {
      return sales;
   }

   public void setSales(int sales) {
      this.sales = sales;
   }

   public int getMale() {
      return male;
   }

   public void setMale(int male) {
      this.male = male;
   }

   public int getFemale() {
      return female;
   }

   public void setFemale(int female) {
      this.female = female;
   }
   public String getMphotopath() {
      return mphotopath;
   }

   public void setMphotopath(String mphotopath) {
      this.mphotopath = mphotopath;
   }

   public int getMovieNo() {
      return movieNo;
   }

   public void setMovieNo(int movieNo) {
      this.movieNo = movieNo;
   }

   public String getMovieTitle() {
      return movieTitle;
   }

   public void setMovieTitle(String movieTitle) {
      this.movieTitle = movieTitle;
   }

   public Date getMovieOpen() {
      return movieOpen;
   }

   public void setMovieOpen(Date movieOpen) {
      this.movieOpen = movieOpen;
   }

   public Date getMovieClose() {
      return movieClose;
   }

   public void setMovieClose(Date movieClose) {
      this.movieClose = movieClose;
   }

   public String getMovieGenre() {
      return movieGenre;
   }

   public void setMovieGenre(String movieGenre) {
      this.movieGenre = movieGenre;
   }

   public String getDirector() {
      return director;
   }

   public void setDirector(String director) {
      this.director = director;
   }

   public String getActor() {
      return actor;
   }

   public void setActor(String actor) {
      this.actor = actor;
   }

   public int getAgeLimit() {
      return ageLimit;
   }

   public void setAgeLimit(int ageLimit) {
      this.ageLimit = ageLimit;
   }

   public int getRunningTime() {
      return runningTime;
   }

   public void setRunningTime(int runningTime) {
      this.runningTime = runningTime;
   }

   public String getTrailerURL() {
      return trailerURL;
   }

   public void setTrailerURL(String trailerURL) {
      this.trailerURL = trailerURL;
   }

   public String getPoster_path() {
      return poster_path;
   }

   public void setPoster_path(String poster_path) {
      this.poster_path = poster_path;
   }

   public String getMovieInfo() {
      return movieInfo;
   }

   public void setMovieInfo(String movieInfo) {
      this.movieInfo = movieInfo;
   }

   @Override
   public String toString() {
      return "Movie [movieNo=" + movieNo + ", movieTitle=" + movieTitle + ", movieGenre=" + movieGenre + ", director="
            + director + ", actor=" + actor + ", ageLimit=" + ageLimit + ", runningTime=" + runningTime
            + ", trailerURL=" + trailerURL + ", poster_path=" + poster_path + ", movieInfo=" + movieInfo + "]";
   }
   
   
}