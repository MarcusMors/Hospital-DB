"use strict"

import { Pool } from "pg"

const pool = new Pool({
	host: "localhost",
	user: "postgres",
	password: "p@ssw0rd2020ya",
	database: "hospital",
	port: 5432,
})

//Login page
const singUser = async (req, res) => {
	res.render("index.html")
}
const compareMsg = async (req, res) => {
	const { username } = req.body
	const { password } = req.body
	let errors = []

	if (!username || !password) {
		errors.push({ message: "Llena todos los campos porfavor" })
	}

	if (errors.length > 0) {
		res.render("index.html", { errors })
		console.log(errors)
	} else {
		const usernameAccess = await pool.query(`SELECT * FROM access WHERE username = $1`, [
			username,
		])
		const passwordAccess = await pool.query(`SELECT * FROM access WHERE password = $1`, [
			password,
		])
		if (usernameAccess.rows.length > 0 && passwordAccess.rows.length > 0) {
			res.render("contact.html")
		} else {
			errors.push({ message: "Credenciales incorrectas" })
			res.render("index.html", { errors })
		}
	}
}

//Main page
const mainPage = async (req, res) => {
	res.render("contact.html")
}

//Patients page
const patientsList = async (req, res) => {
	const lista = await pool.query("SELECT * FROM patients")
	res.render("patients.html", {
		data: lista.rows,
	})
}

//Create user
const createUser = async (req, res) => {
	const data = req.body
	await pool.query(
		`INSERT INTO patients (doctor_id, name, age, birthday, phone) VALUES ($1,$2,$3,$4,$5);`,
		[data.doctor_id, data.name, data.age, data.birthday, data.phone]
	)
	res.redirect("/patients")
}

//Delete patitens page
const deleteUser = async (req, res) => {
	const { id } = req.params
	await pool.query(`DELETE FROM patients WHERE id = ${id}`)
	res.redirect("/patients")
}

export default {
	singUser,
	compareMsg,
	mainPage,
	patientsList,
	createUser,
	deleteUser,
}
