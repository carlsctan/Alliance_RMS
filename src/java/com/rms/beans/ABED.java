package com.rms.beans;

import java.sql.*;

public class ABED
{
	private String databaseName = null;
	private String userName = null;
	private String password = null;
	private String databaseServer = null;

	private Connection con;
	private Statement stmt;

	// --------------------  CONSTRUCTORS ----------------------//

	/** Creates a new instance of ABED */
	public ABED()
	{
	}

	/** Creates a new instance of ABED
	 *  <p>
	 *  @param databaseName This parameter is the name of the database
	 *                      to be used in the MYSQL.
	 *  @param userName This parameter is the MYSQL database's username.
	 *  @param password This parameter is the MYSQL database's password.
	 *  @param databaseServer This parameter contains the ip address of the server source
	 */
	public ABED(String databaseName,String userName,String password,String databaseServer)
	{
		this.databaseName = databaseName;
		this.databaseServer = databaseServer;
		this.userName = userName;
		this.password = password;
	}

	// --------------------   ACCESSORS -------------------------//

	/** Sets the Database name, MYSQL database username and the MYSQL password.
	 *  <p>
	 *     @param databaseName accepts the database name to be used.
	 *     @param userName accepts the MYSQL username.
	 *     @param databaseName accepts the MYSQL password.
	 *     @param databaseServer accepts the MYSQL server source
	 */
	public void setDatabase(String databaseName,String userName,String password,String databaseServer)
	{
		this.databaseName = databaseName;
		this.userName = userName;
		this.databaseServer = databaseServer;
		this.password = password;
	}


	/** Counts how many rows are generated in a specific table.
	 *  (Useful during the instantiation of the 2D array in another class
	 *  The 2D array is a pointer).
	 *  <p>
	 *     @param tableName accepts the table name to be used.
	 *  <p>
	 *     @return returns the number of rows are there in that table used.
	 */
	public int getRow(String tableName)
	{
		int row=0;
		if (openDatabase() ==  false)
		{
			return 0;
		}
		try
		{
			ResultSet rs;

			rs = stmt.executeQuery("select * from "+ tableName);
			rs.last();
			row=rs.getRow();
		}
		catch(SQLException e)
		{
			System.out.println(e.getMessage());
			closeDatabase();
			return 0;
		}

		closeDatabase();

		return row;
	}

	/** Counts how many rows are generated in a specific table given a condition.
	 *  (Useful during the instantation of the 2D array in another class
	 *  The 2D array is a pointer).
	 *  <p>
	 *     @param tableName accepts the table name to be used.
	 *     @param condition accepts the condition.
	 *  <p>
	 *     @return returns the number of rows are there in that table used.
	 */
	public int getRow(String tableName,String condition)
	{
		int row=0;

		if (openDatabase() ==  false)
		{
			return 0;
		}
		try
		{
			ResultSet rs;
			
			rs = stmt.executeQuery("select * from "+ tableName +" where "+condition);
			rs.last();
			row=rs.getRow();
		}
		catch(SQLException e)
		{
			System.out.println(e.getMessage());
			closeDatabase();
			return 0;
		}
		closeDatabase();

		return row;
	}

	public int getRow2(String command)
	{
		int row=0;

		if (openDatabase() ==  false)
		{
			return 0;
		}
		try
		{
			ResultSet rs;

			rs = stmt.executeQuery(command);
			rs.last();
			row=rs.getRow();
		}
		catch(SQLException e)
		{
			System.out.println(e.getMessage());
			closeDatabase();
			return 0;
		}

		closeDatabase();

		return row;
	}
	//asdasdasdasd//
   // -----------------------------  ACCESSIBLE METHODS ------------------------ //



   /** Adds an entry to the table with auto increment in MYSQL.
   *   <p>
   *     @param tableName accepts the table name to be used.
   *     @param Column accepts the column names excluding the auto increment column.
   *     @param data accepts the data to be added into the table excluding the auto increment data.
   *   <p>
   *      @return returns a boolean true if the data is succesfully added into the table
   *              while it returns a boolean false if not succesfull.
   */
   public boolean addEntry(String tableName,String data,String column)
   {
       if (openDatabase() ==  false)
       {
           return false;
       }
       try
       {
           stmt.executeUpdate("insert into "+" "+ tableName +" ("+ column +") "+" values("+data+")");
       }
       catch(SQLException e)
       {
           System.out.println(e.getMessage());
           closeDatabase();
           return false;
       }
       closeDatabase();
       return true;
   }
   
       /** Adds an entry to the table.
   *   <p>
   *     @param tableName accepts the table name to be used.
   *     @param data accepts the data to be added into the table.
   *   <p>
   *      @return returns a boolean true if the data is succesfully added into the table
   *              while it returns a boolean false if not succesfull.
   */
   public boolean addEntry(String tableName,String data)
   {
       if (openDatabase() ==  false)
       {
           return false;
       }
       try
       {
           stmt.executeUpdate("insert into "+" "+ tableName +" "+" values("+data+")");
       }
       catch(SQLException e)
       {
           System.out.println(e.getMessage());
           closeDatabase();
           return false;
       }
       closeDatabase();
       return true;
   }


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   /** Browses all data in a selected columns.
    *  <p>
    *    @param tableName accepts the table name to be used.
    *    @param columnNames accepts the table name to be used.
    *    @param data a 2D array which is used like a pointer initialized from
    *           the other class, that is used for the storage of all data in a row
    *           inside the table.
    *    @param numberOfColumns accepts a programmer defined number of columns
    *           of the table used.
    *  <p>
    *     @return returns a boolean true if the data is succesfully retrieved from the table
    *             while it returns a boolean false if not succesfull.
    */

    public boolean browseEntry(String tableName, String columnNames, String[][] data, int numberOfColumns)
    {
       ResultSet rs;
       if (openDatabase() ==  false)
       {
           return false;
       }
       try
       {
           rs = stmt.executeQuery("select "+columnNames+" from " +  tableName ); // " +columnNames+ "
           rs.beforeFirst();
           if(rs.next())
           {
               rs.beforeFirst();
               int i=0;
               while(rs.next())
               {
                       for(int j=0; j<numberOfColumns; j++)
		                data[i][j]=rs.getString(j+1);
                       i++;
               }
            }
            else
            {
                closeDatabase();
                return false;

            }
       }
       catch(SQLException e)
       {

           System.out.println("Exception in ABED class in tablename "+ tableName +e.getMessage());
           System.out.println("This is within the browseEntry" + columnNames);
           closeDatabase();
           return false;
       }
       closeDatabase();
       return true;
   }

   /** Browses selected columns given some conditions.
    *  <p>
    *    @param tableName accepts the table name to be used.
    *    @param columnNames accepts the table name to be used.
    *    @param data a 2D array which is used like a pointer initialized from
    *           the other class, that is used for the storage of all data in a row
    *           inside the table.
    *    @param numberOfColumns accepts a programmer defined number of columns
    *           of the table used.
    *    @param condition finds the data in a row that the programmer or users wants
    *                   by passing conditons into the method.
    *  <p>
    *     @return returns a boolean true if the data is succesfully retrieved from the table
    *             while it returns a boolean false if not succesfull.
    */
    public boolean browseEntry(String tableName, String columnNames, String[][] data, int numberOfColumns,String condition)
    {
       ResultSet rs;
       if (openDatabase() ==  false)
       {
           return false;
       }
       try
       {
           rs = stmt.executeQuery("select "+columnNames+" from " +  tableName +" where "+ condition);
           rs.beforeFirst();
           if(rs.next())
           {
               rs.beforeFirst();
               int i=0;
               while(rs.next())
               {
                    for(int j=0; j<numberOfColumns; j++)
		       data[i][j]=rs.getString(j+1);
                      i++;
               }
           }
           else
           {
               closeDatabase();
               return false;
           }
       }
       catch(SQLException e)
       {

           System.out.println("Exception in ABED class in tablename "+ tableName +e.getMessage());
           System.out.println("This is within the browseEntry" + columnNames);
           closeDatabase();
           return false;
       }
       closeDatabase();
       return true;
   }



   /** Browses data based on the command that is passed by the programmer. The command
    *  variable is a mysql syntax.
    *  <p>
    *    @param data a 2D array which is used like a pointer initialized from
    *           the other class, that is used for the storage of all data in a row
    *           inside the table.
    *    @param numberOfColumns accepts a programmer defined number of columns.
    *    @param command accepts a mysql syntax.
    *
    *  <p>
    *     @return returns a boolean true if the data is succesfully retrieved from the table
    *             while it returns a boolean false if not succesfull.
    */

    public boolean browseEntry(String data[][],int numberOfColumns, String command)
    {
       ResultSet rs;
       if (openDatabase() ==  false)
       {
           return false;
       }
       try
       {
           rs = stmt.executeQuery(command);
           rs.beforeFirst();
           if(rs.next())
           {
               rs.beforeFirst();
               int i=0;
               while(rs.next())
               {
                    for(int j=0; j<numberOfColumns; j++)
		        data[i][j]=rs.getString(j+1);
                    i++;
               }
           }
           else
           {
               closeDatabase();
               return false;
           }
       }
       catch(SQLException e)
       {

           System.out.println("Exception in ABED class in tablename "+  e.getMessage());
           System.out.println("This is within the browseEntry");
           System.out.println(command);
           closeDatabase();
           return false;
       }
        closeDatabase();
        return true;
   }


   /** Browses all data in a row  based on certain conditions.
    *  The programmer should know how many columns are there created in
    *  the table used and should be passed in the numberOfColumns parameter.
    *  This is used for the limit of the loop in seacrhing all data.
    *  <p>
    *    @param tableName accepts the table name to be used.
    *    @param data a 2D array which is used like a pointer initialized from
    *           the other class, that is used for the storage of all data in a row
    *           inside the table.
    *    @param numberOfColumns accepts a programmer defined number of columns
    *           of the table used.
    *    @param condition condition finds the data in a row that the programmer or users wants
    *                   by passing conditons into the method.
    *  <p>
    *     @return returns a boolean true if the data is succesfully retrieved from the table
    *             while it returns a boolean false if not succesfull.
    */
    public boolean browseEntry(String tableName, String[][] data, int numberOfColumns, String condition)
    {
       ResultSet rs;
       if (openDatabase() ==  false)
       {
           return false;
       }
       try
       {
           rs = stmt.executeQuery("select * from "+ tableName +" where "+condition);
           rs.beforeFirst();
           if(rs.next())
           {
                rs.beforeFirst();
                int i=0;
                while(rs.next())
                {
                      for(int j=0; j<numberOfColumns; j++)
		           data[i][j]=rs.getString(j+1);
                      i++;
                }
           }
           else
           {
               closeDatabase();
               return false;
           }
       }
       catch(SQLException e)
       {

           System.out.println(e.getMessage());
           System.out.println(" " + condition);
           closeDatabase();
           return false;
       }
       closeDatabase();
       return true;
   }
/** Browses specific data. One column with condition
    *  <p>
    *    @param tableName accepts the tabel name to be used.
    *    @param columnName accepts the name of the column where all data in it can be found.
    *    @param data array which is used like a pointer initialized from
    *           the other class, that is used for the storage of the retrieved data
    *           from a specific column name from the table.
         @param condition  condition finds the data in a row that the programmer or users wants
    *                   by passing conditons into the method.
    *  <p>
    *     @return returns a boolean true if the data is succesfully retrieved from the table
    *             while it returns a boolean false if not succesfull.
    *
    *
    *
    *
    */
   public boolean browseEntry(String tableName,String columnName,String[][] data,String condition)
   {
       ResultSet rs;
       if (openDatabase() ==  false)
       {
           return false;
       }
       try
       {
           rs = stmt.executeQuery("select "+ columnName + " from "+ tableName +" where "+ condition);
           rs.beforeFirst();
           if(rs.next())
           {
                 rs.beforeFirst();
                 while(rs.next())
                 {
                     data[rs.getRow()-1][0] = rs.getString(columnName);
                 }
           }
           else
           {
               closeDatabase();
               return false;
           }
       }
       catch(SQLException e)
       {
           System.out.println(e.getMessage());
           closeDatabase();
           return false;
       }
       closeDatabase();
       return true;
   }
   /** Browses data from this table joining other table through the selected columns.
    *  <p>
    *    @param tableName accepts the tabel name to be used.
    *    @param columnName accepts the name of the column where all data in it can be found.
    *    @param data array which is used like a pointer initialized from
    *           the other class, that is used for the storage of the retrieved data
    *           from a specific column name from the table.
         @param condition  condition finds the data in a row that the programmer or users wants
    *                   by passing conditons into the method.
    *  <p>
    *     @return returns a boolean true if the data is succesfully retrieved from the table
    *             while it returns a boolean false if not succesfull.
    *
    *
    *
    *
    */


   public boolean browseEntry(String thisTable,String otherTable,String columnName,String[][] data,int numberOfColumns,String condition)
   {
       ResultSet rs;
       if (openDatabase() ==  false)
       {
           return false;
       }
       try
       {
           rs = stmt.executeQuery("select "+ columnName + " from "+ thisTable +" join " +otherTable+ " where "+ condition);
           rs.beforeFirst();
           if(rs.next())
           {
               int i=0;
               while(rs.next())
               {
                    for(int j=0; j<numberOfColumns; j++)
		        data[i][j]=rs.getString(j+1);
                    i++;
               }
           }
           else
           {
               closeDatabase();
               return false;
           }

       }
       catch(SQLException e)
       {
           System.out.println(e.getMessage());
           closeDatabase();
           return false;
       }
       closeDatabase();
       return true;
   }
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

public boolean command(String command)
   {
       if (openDatabase() ==  false)
       {
           return false;
       }
       try
       {
           stmt.executeUpdate(command);
       }
       catch(SQLException e)
       {
           System.out.println(e.getMessage());
           closeDatabase();
           return false;
       }
       closeDatabase();
       return true;
   }

	
public boolean manyOpenDatabase()
   {
       if (openDatabase() ==  false)
       {
           return false;
       }
		else
			return true;
	}
public boolean manyCommand(String command)
   {
       try
       {
           stmt.executeUpdate(command);
       }
       catch(SQLException e)
       {
           System.out.println(e.getMessage());            
           return false;
       }
       return true;
   }	

public boolean manyCloseDatabase()
   {
	try
		{
		closeDatabase();
		}
	catch (Exception e)
		{
		System.out.println(e.getMessage());
		return false;
		}
	return true;
	}


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   /** Edits an Entry with a conditon given.
    *  <p>
    *    @param tableName accepts the table name to be used.
    *    @param newData accepts a MYSQL syntax, setting the data that is
    *           going to be edited.
    *  <p>
    *    @return returns a boolean true if the data is succesfully edited from the table
    *             while it returns a boolean false if not succesfull.
    */
  public boolean editEntry(String tableName,String newData,String condition)
   {
       if(openDatabase() ==  false)
       {
           return false;
       }
       try
       {
             	stmt.executeUpdate("update "+ tableName +" set " + newData + " where "+ condition);

       }
       catch(SQLException e)
       {
           System.out.println(e.getMessage());
           System.out.println("this is from editEntry 0 " +condition);
           System.out.println("update "+ tableName +" set " + newData + " where "+ condition);
           closeDatabase();
           return false;
       }
       closeDatabase();
       return true;
   }



   /** This method deletes an entry given a condition.
   *   <p>
   *      @param tableName accepts the name of the table to be used.
   *      @param condtion accepts the SQL syntax, setting on what data is to be deleted.
   *    <p>
   *   @return returns a boolean true if the data is succesfully deleted
   *           while false otherwise.
   */
   public boolean deleteEntry(String tableName,String condition)
   {
       if (openDatabase() ==  false)
       {
           return false;
       }
       try
       {
           stmt.executeUpdate("delete from "+ tableName +" where "+ condition );
       }
       catch(SQLException e)
       {
           System.out.println(e.getMessage());
           closeDatabase();
           return false;
       }
       closeDatabase();
       return true;
   }

   // ----------------------- EXCLUSIVE METHODS ----------------------------//


   /** Opens a database for writing or reading.
   *   <p>
   *      @return returns a boolean true the the database is succesfully opened.
   *              returns false if otherwise.
   */
   public boolean openDatabase()
   {
		// jdbc:mysql://localhost/databaseName;
       String url = "jdbc:mysql:"+databaseServer+""+ databaseName;
       String userID = userName, pass = password;

       try
       {
           Class.forName("com.mysql.jdbc.Driver");
       }
       catch(java.lang.ClassNotFoundException e)
       {
           System.err.print("ClassNotFound");
           System.err.println(e.getMessage());
           return false;
       }
       try
       {
           con = DriverManager.getConnection(url,userID,pass);
           stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
       }
       catch(SQLException ex)
       {
           System.out.println("SQLException: " + ex.getMessage());
           return false;
       }
       return true;
   }

   /** Closes the database after opening it.
   */
   public void closeDatabase()
   {
       try
       {
           stmt.close();
           con.close();
       }
       catch(SQLException ex)
       {
           System.out.println("SQLException " + ex.getMessage());

       }
   }

   public Statement getStatement()
   {
	   return stmt;
   }
}