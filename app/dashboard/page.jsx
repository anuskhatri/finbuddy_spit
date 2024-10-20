"use client";

import React, { PureComponent } from "react";
import { LineChart, Line, XAxis, YAxis, CartesianGrid, Tooltip, Legend, ResponsiveContainer } from "recharts";

// Data for the Savings Chart
const data = [
  {
    name: "Week 1",
    savings: 200,
  },
  {
    name: "Week 2",
    savings: 400,
  },
  {
    name: "Week 3",
    savings: 350,
  },
  {
    name: "Week 4",
    savings: 600,
  },
  {
    name: "Week 5",
    savings: 500,
  },
  {
    name: "Week 6",
    savings: 700,
  },
];

// Savings Chart component
class SavingsChart extends PureComponent {
  render() {
    return (
      <div className="w-full h-[40vh] bg-white p-6 rounded-lg shadow-lg border border-gray-200 m-5 ">
        <div className="text-xl font-bold mb-4 text-gray-700">Savings Overview</div>
        <ResponsiveContainer width="100%" height="80%">
          <LineChart
            width={500}
            height={300}
            data={data}
            margin={{
              top: 5,
              right: 30,
              left: 20,
              bottom: 5,
            }}
          >
            <CartesianGrid strokeDasharray="3 3" />
            <XAxis dataKey="name" />
            <YAxis />
            <Tooltip />
            {/* <Legend /> */}
            <Line type="monotone" dataKey="savings" stroke="#82ca9d" activeDot={{ r: 8 }} />
          </LineChart>
        </ResponsiveContainer>
      </div>
    );
  }
}

// Homeselele Component
import Homeselele from "@/components/Homeselele";

// Page Component
const Page = () => {
  return (
    <div className="min-h-screen bg-gray-100 flex flex-col items-center p-5">
      <div className="text-3xl font-semibold text-gray-800 mb-4">
        Welcome to your Dashboard!
      </div>

      {/* Main Section: Left side (Financial Card) and Right side (Bills and Transactions) */}
      <div className="flex w-full flex-wrap justify-between gap-6">
        {/* Recent Transactions */}
        <div className="bg-white p-6 rounded-lg shadow-lg w-full max-w-[100vh] border border-gray-200">
          <div className="text-xl font-bold mb-4 text-gray-700">Recent Transactions</div>
          <table className="min-w-full bg-white border border-gray-200">
            <thead>
              <tr className="bg-gray-100">
                <th className="py-2 px-4 border-b text-left text-gray-700">Date</th>
                <th className="py-2 px-4 border-b text-left text-gray-700">Type</th>
                <th className="py-2 px-4 border-b text-left text-gray-700">Amount</th>
                <th className="py-2 px-4 border-b text-left text-gray-700">Note</th>
              </tr>
            </thead>
            <tbody>
              {/* Example Transaction Rows */}
              <tr>
                <td className="py-2 px-4 border-b">2024-10-19</td>
                <td className="py-2 px-4 border-b text-green-600">Credit</td>
                <td className="py-2 px-4 border-b">$150.00</td>
                <td className="py-2 px-4 border-b">Salary Payment</td>
              </tr>
              <tr>
                <td className="py-2 px-4 border-b">2024-10-18</td>
                <td className="py-2 px-4 border-b text-red-600">Debit</td>
                <td className="py-2 px-4 border-b">$50.00</td>
                <td className="py-2 px-4 border-b">Grocery Shopping</td>
              </tr>
              <tr>
                <td className="py-2 px-4 border-b">2024-10-17</td>
                <td className="py-2 px-4 border-b text-red-600">Debit</td>
                <td className="py-2 px-4 border-b">$20.00</td>
                <td className="py-2 px-4 border-b">Transportation</td>
              </tr>
            </tbody>
          </table>
        </div>

        {/* Left Box for Financial Wellness */}
        <div className="bg-white p-6 rounded-lg shadow-lg w-[65vh] h-[45vh] border border-gray-200">
          {/* Card header */}
          <div className="text-xl font-bold mb-4 text-gray-700">Financial Wellness Score</div>
          {/* Card content */}
          <Homeselele />
        </div>

        {/* Left Bottom: Savings Line Chart */}
        <div className="flex flex-col w-[65vh]  gap-6">
          {/* Savings Chart */}
          <SavingsChart />
        </div>

        {/* Right side: Bills Box and Transaction Table */}
        <div className="flex flex-col w-[80vh] gap-6">
          {/* Bills Box */}
          <div className="bg-white p-6 rounded-lg shadow-lg w-full h-[45vh] border border-gray-200 overflow-y-auto">
            <div className="text-xl font-bold mb-4 text-gray-700">Bills</div>
            {/* List of bills with status color coding and notes */}
            <ul className="space-y-4">
              <li className="flex justify-between text-gray-700">
                <div className="flex flex-col">
                  <span className="text-gray-800">Electricity Bill</span>
                  <span className="text-sm text-gray-500">Due on 2024-10-30</span>
                </div>
                <span className="text-red-500 font-semibold">Due $75.00</span>
                <span className="text-xs text-red">Note: Pay by end of the month</span>
              </li>
              <li className="flex justify-between text-gray-700">
                <div className="flex flex-col">
                  <span className="text-gray-800">Water Bill</span>
                  <span className="text-sm text-gray-500">Paid on 2024-10-10</span>
                </div>
                <span className="text-green-500 font-semibold">Paid $40.00</span>
                <span className="text-xs text-red">Note: Last month's payment</span>
              </li>
              <li className="flex justify-between text-gray-700">
                <div className="flex flex-col">
                  <span className="text-gray-800">Internet Bill</span>
                  <span className="text-sm text-gray-500">Due on 2024-10-25</span>
                </div>
                <span className="text-yellow-500 font-semibold">Due Soon $60.00</span>
                <span className="text-xs text-red">Note: Consider package upgrade</span>
              </li>
              <li className="flex justify-between text-gray-700">
                <div className="flex flex-col">
                  <span className="text-gray-800">Credit Card Payment</span>
                  <span className="text-sm text-gray-500">Due on 2024-10-31</span>
                </div>
                <span className="text-red-500 font-semibold">Due $150.00</span>
                <span className="text-xs text-red">Note: Min payment is $50</span>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Page;
