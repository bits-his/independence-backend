export default (sequelize, DataTypes) => {
  const User = sequelize.define(
    'Users',
    {
      first_name: DataTypes.STRING,
      last_name: DataTypes.STRING,
      email: DataTypes.STRING,
      phone_no: DataTypes.STRING,
      password: DataTypes.STRING,
      role: DataTypes.STRING,
      status:DataTypes.STRING,
    },
    {
      tableName : "users"
    }
  );

  User.associate = function(models) {
    // associations go here
  };

  return User;
};
