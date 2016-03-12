package vote;

public class Container {
	int id;
	String firstName;
	String lastName;
	String middleName;
	String birthDate;
	String location;
	Container(int id, String firstName, String lastName, String middleName, String birthDate, String location){
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.middleName = middleName;
		this.birthDate = birthDate;
		this.location = location;
	}
	public int getID(){
		return id;
	}
	public String getFirstName(){
		return firstName;
	}
	public 	String getLastName(){
		return lastName;
	}
	public String getMiddleName(){
		return middleName;
	}
	public String getBirthDate(){
		return birthDate;
	}
	public String getLocation(){
		return location;
	}
}
