//STEP 1. Import required packages
import java.sql.*;
import java.util.*;
public class main {
    // JDBC driver name and database URL
    static final String PATH_TO_CONNECTOR = "/Users/samueljacobs/Documents/eclipse/plugins/mysql-connector-java-5.1.34-bin.jar";
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://cecs-db01.coe.csulb.edu:3306/cecs323m57";
    //  Database credentials
    static final String USER = "cecs323m57";
    static final String PASS = "Ahbeph";
    static Scanner userInputListener = new Scanner(System.in);
    public static void main(String[] args) {
        // ******************************************************************************************
        
        Connection conn = null;
        Statement stmt = null;
        
        try{
            //STEP 2: Register JDBC driver
            Class.forName(JDBC_DRIVER);
            //Class.forName("com.mysql.jdbc.Driver");
            //STEP 3: Open a connection
            System.out.println("Connecting to a selected database...");
            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            System.out.println("Connected database successfully...");
            //STEP 4: Execute a query
            System.out.println("Creating statement...");
            stmt = conn.createStatement();
        }
        catch(SQLException se){
            //Handle errors for JDBC
            se.printStackTrace();
        }
        catch(Exception e){
            //Handle errors for Class.forName
            e.printStackTrace();
        }finally{
            //finally block used to close resources
            try{
                if(stmt!=null)
                    conn.close();
            }catch(SQLException se){
            }// do nothing
            try{
                if(conn!=null)
                    conn.close();
            }catch(SQLException se){
                se.printStackTrace();
            }//end finally try
        }//end try
        // ******************************************************************************************
        
        
	       int userMenuChoice;
	       boolean doneRunningProgram = false;
	       do {
               System.out.println("\n\n************************************************************************");
               System.out.println("*                        JDBC PROGRAM VERSION 1.0                      *");
               System.out.println("************************************************************************");
               System.out.println("* 1: List all album titles");
               System.out.println("* 2: List all the data for an album specified by the user");
               System.out.println("* 3: Insert a new album");
               System.out.println("* 4: Insert a new studio and update all albums published by one studio to be published by the new studio");
               System.out.println("* 5: Remove an album specified by the user");
               System.out.println("* 6: Exit");
               System.out.println("************************************************************************");
               
               userMenuChoice = userInputListener.nextInt();
               System.out.println("You chose: " + userMenuChoice);
               
               // Make a decision based on the input
               switch(userMenuChoice) {
                   case 1:
                       
                       try{
                           //STEP 2: Register JDBC driver
                           Class.forName(JDBC_DRIVER);
                           //Class.forName("com.mysql.jdbc.Driver");
                           //STEP 3: Open a connection
                           System.out.println("Connecting to a selected database...");
                           conn = DriverManager.getConnection(DB_URL, USER, PASS);
                           System.out.println("Connected database successfully...");
                           //STEP 4: Execute a query
                           System.out.println("Creating statement...");
                           stmt = conn.createStatement();
                           //  String sql = "Select * FROM albums";
                           //stmt.executeUpdate(sql);
                           // Now you can extract all the records
                           // to see the updated records
                           String sql = "SELECT * FROM Album";
                           ResultSet rs = stmt.executeQuery(sql);
                           while(rs.next()){
                               //Retrieve by column name
                               //Display values
                               System.out.print("\nNumberOfSongs: " + rs.getInt("NumberOfSongs"));
                               System.out.print(", AlbumTitle: " + rs.getString("AlbumTitle"));
                               System.out.print(", GroupName: " + rs.getString("GroupName"));
                               System.out.print(", GroupName: " + rs.getString("GroupName"));
                               System.out.print(", GroupName: " + rs.getString("GroupName"));
                               System.out.print(", GroupName: " + rs.getString("GroupName"));
                               System.out.print(", GroupName: " + rs.getString("*"));
                               
                               
                           }
                           rs.close();
                           
                       }
                       catch(SQLException se){
                           //Handle errors for JDBC
                           se.printStackTrace();
                       }
                       catch(Exception e){
                           //Handle errors for Class.forName
                           e.printStackTrace();
                       }finally{
                           //finally block used to close resources
                           try{
                               if(stmt!=null)
                                   conn.close();
                           }catch(SQLException se){
                           }// do nothing
                           try{
                               if(conn!=null)
                                   conn.close();
                           }catch(SQLException se){
                               se.printStackTrace();
                           }//end finally try
                       }//end try
                       break;
                   case 2:
                       System.out.println("Enter an album name to retrieve all data associated with it: ");
                       String albumToSearchForm = userInputListener.nextLine();
                       try{
                           //STEP 2: Register JDBC driver
                           Class.forName(JDBC_DRIVER);
                           //Class.forName("com.mysql.jdbc.Driver");
                           //STEP 3: Open a connection
                           System.out.println("Connecting to a selected database...");
                           conn = DriverManager.getConnection(DB_URL, USER, PASS);
                           System.out.println("Connected database successfully...");
                           //STEP 4: Execute a query
                           System.out.println("Creating statement...");
                           stmt = conn.createStatement();
                           //  String sql = "Select * FROM albums";
                           //stmt.executeUpdate(sql);
                           // Now you can extract all the records
                           // to see the updated records
                           String sql = "SELECT * FROM Album WHERE AlbumTitle='" + albumToSearchForm + "'";
                           ResultSet rs = stmt.executeQuery(sql);
                           while(rs.next()){
                               //Retrieve by column name
                               //int id  = rs.getInt("id");
                               int NumberOfSongs = rs.getInt("NumberOfSongs");
                               String AlbumTitle = rs.getString("AlbumTitle");
                               String GroupName = rs.getString("GroupName");
                               //Display values
                               System.out.print("\nNumberOfSongs: " + NumberOfSongs);
                               System.out.print(", AlbumTitle: " + AlbumTitle);
                               System.out.print(", GroupName: " + GroupName);
                               
                           }
                           rs.close();
                           
                       }
                       catch(SQLException se){
                           //Handle errors for JDBC
                           se.printStackTrace();
                       }
                       catch(Exception e){
                           //Handle errors for Class.forName
                           e.printStackTrace();
                       }finally{
                           //finally block used to close resources
                           try{
                               if(stmt!=null)
                                   conn.close();
                           }catch(SQLException se){
                           }// do nothing
                           try{
                               if(conn!=null)
                                   conn.close();
                           }catch(SQLException se){
                               se.printStackTrace();
                           }//end finally try
                       }//end try
                       break;
                   case 3:
                       System.out.println("Inserting New Album");
                       
                       userInputListener.nextLine();
                       System.out.print("\n * Number of Songs: ");
                       String NumberOfSongsToInsert = userInputListener.nextLine();
                       System.out.print("\n * Album Title: ");
                       String AlbumTitleToInsert = userInputListener.nextLine();
                       System.out.print("\n * Recorded Date: ");
                       String RecordedDateToInsert = userInputListener.nextLine();
                       System.out.print("\n * Length: ");
                       String LengthToInsert = userInputListener.nextLine();
                       System.out.print("\n * Group Name: ");
                       String GroupNameToInsert = userInputListener.nextLine();
                       System.out.print("\n * Studio Name: ");
                       String StudioNameToInsert = userInputListener.nextLine();
                       try {
                           //STEP 2: Register JDBC driver
                           Class.forName(JDBC_DRIVER);
                           //Class.forName("com.mysql.jdbc.Driver");
                           //STEP 3: Open a connection
                           System.out.println("Connecting to a selected database...");
                           conn = DriverManager.getConnection(DB_URL, USER, PASS);
                           System.out.println("Connected database successfully...");
                           //STEP 4: Execute a query
                           System.out.println("Creating statement...");
                           stmt = conn.createStatement();
                           String sqlInsert = "INSERT INTO Album " +
                           "VALUES ('" + NumberOfSongsToInsert +"', " +
                           "'" + AlbumTitleToInsert + "', " +
                           "'" + RecordedDateToInsert + "', " +
                           "'" + LengthToInsert + "', " +
                           "'" + GroupNameToInsert + "', " +
                           "'" + StudioNameToInsert + "');" ;
                           System.out.println("SQL Execute String: " + sqlInsert);
                           
                           stmt.executeUpdate(sqlInsert);
                           // Now you can extract all the records
                           // to see the updated records
                           String sql = "SELECT * FROM Album";
                           ResultSet rs = stmt.executeQuery(sql);
                           while(rs.next()){
                               //Retrieve by column name
                               //int id  = rs.getInt("id");
                               int NumberOfSongs = rs.getInt("NumberOfSongs");
                               String AlbumTitle = rs.getString("AlbumTitle");
                               String GroupName = rs.getString("GroupName");
                               //Display values
                               System.out.print("\nNumberOfSongs: " + NumberOfSongs);
                               System.out.print(", AlbumTitle: " + AlbumTitle);
                               System.out.print(", GroupName: " + GroupName);
                               
                           }
                           rs.close();
                           
                       }
                       catch(SQLException se){
                           //Handle errors for JDBC
                           se.printStackTrace();
                       }
                       catch(Exception e){
                           //Handle errors for Class.forName
                           e.printStackTrace();
                       }finally{
                           //finally block used to close resources
                           try{
                               if(stmt!=null)
                                   conn.close();
                           }catch(SQLException se){
                           }// do nothing
                           try{
                               if(conn!=null)
                                   conn.close();
                           }catch(SQLException se){
                               se.printStackTrace();
                           }//end finally try
                       }//end try
                       break;
                       // Insert a new studio and update all the existing albums and studios
                   case 4:
                       System.out.println("Inserting New Studio and Updating all albums");
                       
                       userInputListener.nextLine();
                       System.out.print("\n * Studio Name: ");
                       String StudioNameToCreate = userInputListener.nextLine();
                       System.out.print("\n * Studio Address: ");
                       String StudioAddressToInsert = userInputListener.nextLine();
                       System.out.print("\n * Studio Owner: ");
                       String StudioOwnerToInsert = userInputListener.nextLine();
                       System.out.print("\n * Studio Phone Number: ");
                       String StudioPhoneToInsert = userInputListener.nextLine();
                       try {
                           //STEP 2: Register JDBC driver
                           Class.forName(JDBC_DRIVER);
                           //Class.forName("com.mysql.jdbc.Driver");
                           //STEP 3: Open a connection
                           System.out.println("Connecting to a selected database...");
                           conn = DriverManager.getConnection(DB_URL, USER, PASS);
                           System.out.println("Connected database successfully...");
                           //STEP 4: Execute a query
                           System.out.println("Creating statement...");
                           stmt = conn.createStatement();
                           String sqlInsert = "INSERT INTO RecordingStudio " +
                           "VALUES ('" + StudioNameToCreate +"', " + 
                           "'" + StudioAddressToInsert + "', " +
                           "'" + StudioOwnerToInsert + "', " +
                           "'" + StudioPhoneToInsert + "');" ; 
                           System.out.println("SQL Execute String: " + sqlInsert);
                           
                           stmt.executeUpdate(sqlInsert);
                           // Now you can extract all the records
                           // to see the updated records
                           String sql = "SELECT * FROM RecordingStudio";
                           ResultSet rs = stmt.executeQuery(sql);
                           while(rs.next()){
                               //Retrieve by column name
                               
                               String StudioName = rs.getString("StudioName");
                               String StudioAddress = rs.getString("StudioAddress");
                               String StudioOwner = rs.getString("StudioOwner");
                               //Display values
                               System.out.print("\nStudioName: " + StudioName);
                               System.out.print(", StudioAddress: " + StudioAddress);
                               System.out.print(", StudioOwner: " + StudioOwner);
                               
                           }
                           rs.close();
                           
                       }
                       catch(SQLException se){
                           //Handle errors for JDBC
                           se.printStackTrace();
                       }
                       catch(Exception e){
                           //Handle errors for Class.forName
                           e.printStackTrace();
                       }finally{
                           //finally block used to close resources
                           try{
                               if(stmt!=null)
                                   conn.close();
                           }catch(SQLException se){
                           }// do nothing
                           try{
                               if(conn!=null)
                                   conn.close();
                           }catch(SQLException se){
                               se.printStackTrace();
                           }//end finally try
                       }//end try
                       break;
                   case 5: // Remove an album
                       try{
                           //STEP 2: Register JDBC driver
                           Class.forName(JDBC_DRIVER);
                           //Class.forName("com.mysql.jdbc.Driver");
                           //STEP 3: Open a connection
                           System.out.println("Connecting to a selected database...");
                           conn = DriverManager.getConnection(DB_URL, USER, PASS);
                           System.out.println("Connected database successfully...");
                           //STEP 4: Execute a query
                           System.out.println("Creating statement...");
                           System.out.println("Deleting Album Specified by User");
                           
                           userInputListener.nextLine();
                           System.out.print("\n * Album Name: ");
                           String AlbumNameToDelete = userInputListener.nextLine();
                           stmt = conn.createStatement();
                           String sql = "DELETE  FROM Album where AlbumTitle='" + AlbumNameToDelete + "'";
                           stmt.executeUpdate(sql);
                           // Now you can extract all the records
                           // to see the updated records
                           
                           stmt.close();
                           
                       }
                       catch(SQLException se){
                           //Handle errors for JDBC
                           se.printStackTrace();
                       }
                       catch(Exception e){
                           //Handle errors for Class.forName
                           e.printStackTrace();
                       }finally{
                           //finally block used to close resources
                           try{
                               if(stmt!=null)
                                   conn.close();
                           }catch(SQLException se){
                           }// do nothing
                           try{
                               if(conn!=null)
                                   conn.close();
                           }catch(SQLException se){
                               se.printStackTrace();
                           }//end finally try
                       }//end try
                       break;		
                   case 6:
                       doneRunningProgram = true;
                       break;
                   default: 
                       break;
               }
               
               
           } while (!doneRunningProgram);// End of superloop
        
        
        System.out.println("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
        System.out.println("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
        System.out.println("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
        System.out.println("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
        System.out.println("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
        System.out.println("Goodbye");
        
        
    }//end main
}//end JDBCExample

