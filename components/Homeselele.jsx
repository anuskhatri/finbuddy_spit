"use client"
import React from 'react';
import { PieChart, Pie, Cell, ResponsiveContainer, Legend } from 'recharts';

const FinancialWellnessScore = () => {
  const data = [
    { name: 'Score Achieved', value: 800 },
    { name: 'Target Miss', value: 100 },
  ];

  const COLORS = ['#4CAF50', '#FF5722', '#FFC107'];
  const RADIAN = Math.PI / 180;

  const renderCustomizedLabel = ({ cx, cy, midAngle, innerRadius, outerRadius, percent, index }) => {
    const radius = innerRadius + (outerRadius - innerRadius) * 0.5;
    const x = cx + radius * Math.cos(-midAngle * RADIAN);
    const y = cy + radius * Math.sin(-midAngle * RADIAN);

    return (
      <text x={x} y={y} fill="white" textAnchor={x > cx ? 'start' : 'end'} dominantBaseline="central">
        {`${(percent * 100).toFixed(0)}%`}
      </text>
    );
  };

  return (
    <div style={{ textAlign: 'center', width: '100%', maxWidth: '400px', margin: '0 auto' }} className='bg-wheat'>
      <h3>Financial Wellness Score</h3>
      <ResponsiveContainer width="100%" height={210}>
        <PieChart>
          <Pie
            data={data}
            cx="50%"
            cy="50%"
            labelLine={false}
            label={renderCustomizedLabel}
            outerRadius={80}
            fill="#8884d8"
            dataKey="value"
          >
            {data.map((entry, index) => (
              <Cell key={`cell-${index}`} fill={COLORS[index % COLORS.length]} />
            ))}
          </Pie>
          <Legend verticalAlign="top" height={5} />
        </PieChart>
      </ResponsiveContainer>
      <div className="text-sm text-gray-500 mt-4 text-center">
        Your current financial health and wellness score.
      </div>
    </div>
  );
};

export default FinancialWellnessScore;
